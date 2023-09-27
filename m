Return-Path: <linux-usb+bounces-643-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7B77B05B0
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 15:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 50B451C20A41
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 13:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1472337168;
	Wed, 27 Sep 2023 13:43:42 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4337926E19
	for <linux-usb@vger.kernel.org>; Wed, 27 Sep 2023 13:43:40 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id B827D10A
	for <linux-usb@vger.kernel.org>; Wed, 27 Sep 2023 06:43:38 -0700 (PDT)
Received: (qmail 1499934 invoked by uid 1000); 27 Sep 2023 09:43:37 -0400
Date: Wed, 27 Sep 2023 09:43:37 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Douglas Anderson <dianders@chromium.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Hayes Wang <hayeswang@realtek.com>,
  "David S . Miller" <davem@davemloft.net>, linux-usb@vger.kernel.org,
  Grant Grundler <grundler@chromium.org>, Edward Hill <ecgh@chromium.org>,
  andre.przywara@arm.com, bjorn@mork.no, edumazet@google.com, gaul@gaul.org,
  horms@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
  pabeni@redhat.com
Subject: Re: [PATCH 2/3] r8152: Retry register reads/writes
Message-ID: <62fec09e-c881-498e-9ac0-d0a6de665f16@rowland.harvard.edu>
References: <20230926212824.1512665-1-dianders@chromium.org>
 <20230926142724.2.I65ea4ac938a55877dc99fdf5b3883ad92d8abce2@changeid>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230926142724.2.I65ea4ac938a55877dc99fdf5b3883ad92d8abce2@changeid>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Sep 26, 2023 at 02:27:27PM -0700, Douglas Anderson wrote:
> +
> +static
> +int r8152_control_msg(struct usb_device *udev, unsigned int pipe, __u8 request,
> +		      __u8 requesttype, __u16 value, __u16 index, void *data,
> +		      __u16 size, const char *msg_tag)
> +{
> +	int i;
> +	int ret;
> +
> +	for (i = 0; i < REGISTER_ACCESS_TRIES; i++) {
> +		ret = usb_control_msg(udev, pipe, request, requesttype,
> +				      value, index, data, size,
> +				      USB_CTRL_GET_TIMEOUT);
> +
> +		/* No need to retry or spam errors if the USB device got
> +		 * unplugged; just return immediately.
> +		 */
> +		if (udev->state == USB_STATE_NOTATTACHED)
> +			return ret;

Rather than testing udev->state, it would be better to check whether
ret == -ENODEV.  udev->state is meant primarily for use by the USB core
and it's subject to races.

Alan Stern


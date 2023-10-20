Return-Path: <linux-usb+bounces-1995-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C4C7D131C
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 17:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02E57282549
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 15:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EACA31E508;
	Fri, 20 Oct 2023 15:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D4D1DFC5
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 15:46:51 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id D09CAAB
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 08:46:49 -0700 (PDT)
Received: (qmail 300745 invoked by uid 1000); 20 Oct 2023 11:46:49 -0400
Date: Fri, 20 Oct 2023 11:46:49 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Douglas Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  linux-usb@vger.kernel.org, Grant Grundler <grundler@chromium.org>,
  Hayes Wang <hayeswang@realtek.com>, Bastien Nocera <hadess@hadess.net>,
  Benjamin Tissoires <benjamin.tissoires@redhat.com>,
  Flavio Suligoi <f.suligoi@asem.it>, Hans de Goede <hdegoede@redhat.com>,
  Heikki Krogerus <heikki.krogerus@linux.intel.com>,
  Ivan Orlov <ivan.orlov0322@gmail.com>,
  Marc Kleine-Budde <mkl@pengutronix.de>,
  "Rafael J. Wysocki" <rafael@kernel.org>, Ray Chi <raychi@google.com>,
  Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>,
  Rob Herring <robh@kernel.org>, Roy Luo <royluo@google.com>,
  Stanley Chang <stanley_chang@realtek.com>,
  Vincent Mailhol <mailhol.vincent@wanadoo.fr>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: Prevent infinite loops when
 usb_reset_device() unbinds/binds
Message-ID: <60a358c9-b44b-4d25-9a20-aa9e00c65ab6@rowland.harvard.edu>
References: <20231020083125.1.I3e5f7abcbf6f08d392e31a5826b7f234df662276@changeid>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020083125.1.I3e5f7abcbf6f08d392e31a5826b7f234df662276@changeid>

On Fri, Oct 20, 2023 at 08:31:38AM -0700, Douglas Anderson wrote:
> When we call usb_reset_device() and a driver doesn't implement
> pre_reset() and post_reset() methods then the USB core will attempt to
> unbind and rebind the driver in order to make reset work. This is a
> great general solution, but it has the potential to loop forever.
> Specifically, if the USB device is in a state that the USB device
> driver issues another usb_reset_device() after each rebind then we'll
> just continually unbind and rebind with no end.
> 
> It's difficult to address this condition in a USB device driver
> because it's hard for the driver to keep state across each
> unbind/bind.

How about just adding appropriate pre_reset() and post_reset() methods? 
This is precisely what they are meant for.  Then the the unbind/rebind 
loop wouldn't ever get started.

Alan Stern


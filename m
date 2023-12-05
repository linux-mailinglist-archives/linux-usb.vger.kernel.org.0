Return-Path: <linux-usb+bounces-3748-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CF9805D2C
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 19:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C0971F215C4
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 18:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6ACF68B8E;
	Tue,  5 Dec 2023 18:21:41 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id D5B0AAC
	for <linux-usb@vger.kernel.org>; Tue,  5 Dec 2023 10:21:37 -0800 (PST)
Received: (qmail 425651 invoked by uid 1000); 5 Dec 2023 13:21:37 -0500
Date: Tue, 5 Dec 2023 13:21:37 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Hardik Gajjar <hgajjar@de.adit-jv.com>
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, linux-usb@vger.kernel.org,
  linux-kernel@vger.kernel.org, erosca@de.adit-jv.com, tj@kernel.org,
  paulmck@kernel.org, Martin.Mueller5@de.bosch.com
Subject: Re: [PATCH 1/2] usb: hub: Replace hardcoded quirk value with BIT()
 macro
Message-ID: <6071af53-e3a0-4394-a51b-81db562d0940@rowland.harvard.edu>
References: <20231205181829.127353-1-hgajjar@de.adit-jv.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205181829.127353-1-hgajjar@de.adit-jv.com>

On Tue, Dec 05, 2023 at 07:18:28PM +0100, Hardik Gajjar wrote:
> This patch replaces the hardcoded quirk value in the macro with
> BIT().
> 
> Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>


Return-Path: <linux-usb+bounces-4136-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBAF811C1B
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 19:16:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28AA31F212FB
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 18:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46AF5A0FF;
	Wed, 13 Dec 2023 18:15:28 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 50315F3
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 10:15:24 -0800 (PST)
Received: (qmail 207225 invoked by uid 1000); 13 Dec 2023 13:15:23 -0500
Date: Wed, 13 Dec 2023 13:15:23 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Lee Jones <lee@kernel.org>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH 12/12] usb: storage: Remove snprintf() from sysfs
 call-backs and replace with sysfs_emit()
Message-ID: <0bbff761-a39c-4ac5-a906-8d55ad02d168@rowland.harvard.edu>
References: <20231213164246.1021885-1-lee@kernel.org>
 <20231213164246.1021885-13-lee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213164246.1021885-13-lee@kernel.org>

On Wed, Dec 13, 2023 at 04:42:41PM +0000, Lee Jones wrote:
> Since snprintf() has the documented, but still rather strange trait of
> returning the length of the data that *would have been* written to the
> array if space were available, rather than the arguably more useful
> length of data *actually* written, it is usually considered wise to use
> something else instead in order to avoid confusion.
> 
> In the case of sysfs call-backs, new wrappers exist that do just that.
> 
> Link: https://lwn.net/Articles/69419/
> Link: https://github.com/KSPP/linux/issues/105
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: usb-storage@lists.one-eyed-alien.net
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>


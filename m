Return-Path: <linux-usb+bounces-3513-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C24E77FF69A
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 17:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4978BB20FAF
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 16:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C88C4644D;
	Thu, 30 Nov 2023 16:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 188701A4
	for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 08:45:37 -0800 (PST)
Received: (qmail 253173 invoked by uid 1000); 30 Nov 2023 11:45:36 -0500
Date: Thu, 30 Nov 2023 11:45:36 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: USB list <linux-usb@vger.kernel.org>
Subject: Re: return type of usb_endpoint_maxp()
Message-ID: <f84e4301-4c05-4535-976e-50785de778e9@rowland.harvard.edu>
References: <802913d7-88d8-42cc-a775-493a7a426882@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <802913d7-88d8-42cc-a775-493a7a426882@suse.com>

On Thu, Nov 30, 2023 at 12:31:05PM +0100, Oliver Neukum wrote:
> Hi,
> 
> looking at usb_endpoint_maxp() it seems odd to me that
> the return type is a _signed_ integer. Is that a deeper
> secret or just defaulting to "int"?

Just the default, no deeper meaning or reason.  It hardly matters, 
since the values range only between 0 and 2047.

Alan Stern


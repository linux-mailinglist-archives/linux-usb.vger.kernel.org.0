Return-Path: <linux-usb+bounces-2539-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D53B17E0FD8
	for <lists+linux-usb@lfdr.de>; Sat,  4 Nov 2023 15:13:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B9EC1C20A17
	for <lists+linux-usb@lfdr.de>; Sat,  4 Nov 2023 14:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDADE1A591;
	Sat,  4 Nov 2023 14:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435711DDF4
	for <linux-usb@vger.kernel.org>; Sat,  4 Nov 2023 14:12:55 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 37EDE194
	for <linux-usb@vger.kernel.org>; Sat,  4 Nov 2023 07:12:48 -0700 (PDT)
Received: (qmail 886183 invoked by uid 1000); 4 Nov 2023 10:12:48 -0400
Date: Sat, 4 Nov 2023 10:12:48 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Milan Broz <gmazyland@gmail.com>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
  linux-scsi@vger.kernel.org, gregkh@linuxfoundation.org, oneukum@suse.com
Subject: Re: [PATCH v5] usb-storage,uas: use host helper to generate driver
 info
Message-ID: <537f0db7-84b3-4f01-a4e5-49164878d7a9@rowland.harvard.edu>
References: <20231028174145.691523-1-gmazyland@gmail.com>
 <20231103201709.124372-1-gmazyland@gmail.com>
 <d26c884e-3505-436f-9a76-ec701fb5e2bb@rowland.harvard.edu>
 <b8fd6e0b-8164-4992-8124-135744430b9c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8fd6e0b-8164-4992-8124-135744430b9c@gmail.com>

On Sat, Nov 04, 2023 at 09:01:44AM +0100, Milan Broz wrote:
> Thanks.
> 
> Unfortunately, the build rules, I removed in this version, are needed, see
> https://lore.kernel.org/oe-kbuild-all/202311041507.AOYwj5tK-lkp@intel.com/

Bizarre.  I wonder why it worked on my system but not in the test build.  
Maybe because I wasn't starting from a clean slate but instead from one 
where old versions of the object files already existed.

> I'll keep fixed version in my branch on kernel.org for a day and once
> there are no such bot reports, new version v6 appears in the list.

Okay.

Alan Stern


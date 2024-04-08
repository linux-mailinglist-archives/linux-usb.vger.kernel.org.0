Return-Path: <linux-usb+bounces-9083-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F34589CA1E
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 18:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E3CDB25D8C
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 16:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30732142E7A;
	Mon,  8 Apr 2024 16:55:22 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id BB5111428F5
	for <linux-usb@vger.kernel.org>; Mon,  8 Apr 2024 16:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712595321; cv=none; b=M2OhKzLWBFFL/6r8Tvnn33LgVtKSLxR5GJSoJ1DeQhCHeZ5RGxWHD5OAAnWsFZZcK4uMMcAmtt00G11ZNFvdVsl33pBWb95zIgfA0FNEGy0irX1S4rRuxQleBOR9tw6Cp+Un3BTM9oknJlHFagUNPz9fobrWfZsri3pEkL+m1Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712595321; c=relaxed/simple;
	bh=zzYor1ygm+f5N8H2iM4wmYWeRLb5WKInz+glyCWOYAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=jjtcW/q7x5BD+/E98U1GunZTAs6BOXwo7yyCZOQf0nzk+zSzeUlbTNhP+ojR2OUkCryXWxmjSdzhkpz6eoXj6pmEOibmAbuVfaN4hrunXQNs/G8ri2q0xxftUxzO/uNHFpVrwEs8lSE/7kKmvgspM5ElDyjr9/n3qYppBwFVDH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 140201 invoked by uid 1000); 8 Apr 2024 12:55:13 -0400
Date: Mon, 8 Apr 2024 12:55:13 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jiri Kosina <jikos@kernel.org>,
  Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org, USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: INFO: rcu detected stall in hub_event
Message-ID: <ade3bb13-e612-49a6-ace2-bf6eeca93f8e@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1912091318210.1462-100000@iolanthe.rowland.org>

Jiri and Benjamin:

Tracking down an old syzbot report from over four years ago (but still 
not closed out!) led me to this email thread.  It turned out there were 
two separate bugs involved, one of which has since been fixed.  I don't 
remember the issues very well, so here's a copy of what I wrote back 
then:

On Mon, 09 Dec 2019, Alan Stern wrote:

>  The big problem is that the parser assumes all usages will
> belong to a collection.
> 
> There's also a second, smaller bug: hid_apply_multipler() assumes every
> Resolution Multiplier control is associated with a Logical Collection
> (i.e., there's no way the routine can ever set multiplier_collection to
> NULL) even though there's a big quotation from the HID Usage Table
> manual at the start of the function saying that they don't have to be.  
> This bug can be fixed easily, though.
> 
> The first bug is more troublesome.  hid_add_usage() explicitly sets the 
> parser->local.collection_index[] entry to 0 if the current collection 
> stack is empty.  But there's no way to distinguish this 0 from a 
> genuine index value that happens to point to the first collection!
> 
> So what should happen when a usage appears outside of all collections?  
> Is it a bug in the report descriptor (the current code suggests that it 
> is not)?
> 
> Or should we use a different sentinel value for the collection_index[]
> entry, one that cannot be confused with a genuine value, such as
> UINT_MAX?

Syzbot tested a proposed patch:

On Tue, 26 Nov 2019, syzbot wrote:

> Hello,
>
> syzbot has tested the proposed patch and the reproducer did not trigger
> crash:
>
> Reported-and-tested-by:
> syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com

Here is the patch that syzbot tested:

 drivers/hid/hid-core.c |    5 +++++
 1 file changed, 5 insertions(+)

Index: usb-devel/drivers/hid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-core.c
+++ usb-devel/drivers/hid/hid-core.c
@@ -1057,6 +1057,8 @@ static void hid_apply_multiplier(struct
 	while (multiplier_collection->parent_idx != -1 &&
 	       multiplier_collection->type != HID_COLLECTION_LOGICAL)
 		multiplier_collection = &hid->collection[multiplier_collection->parent_idx];
+	if (multiplier_collection->type != HID_COLLECTION_LOGICAL)
+		multiplier_collection = NULL;
 
 	effective_multiplier = hid_calculate_multiplier(hid, multiplier);
 
@@ -1191,6 +1193,9 @@ int hid_open_report(struct hid_device *d
 	}
 	device->collection_size = HID_DEFAULT_NUM_COLLECTIONS;
 
+	/* Needed for usages before the first collection */
+	device->collection[0].parent_idx = -1;
+
 	ret = -EINVAL;
 	while ((start = fetch_item(start, end, &item)) != NULL) {
 

The second hunk, addressing the first bug described above, was 
implemented in commit ea427a222d8b ("HID: core: Fix deadloop in 
hid_apply_multiplier.") in 2023.  But the first hunk, addressing the 
second bug, is still outstanding.

You guys undoubtedly understand this code much better than I do.  Is the 
first hunk in this patch still required?  Is it a correct fix for 
handling Resolution Multiplier controls not associated with any Logical 
Collection?

Alan Stern


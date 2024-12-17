Return-Path: <linux-usb+bounces-18593-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8E79F50A3
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 17:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C52318908FD
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 16:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB271F76D5;
	Tue, 17 Dec 2024 16:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="b7VdfIIy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8311F7545
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 16:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734451454; cv=none; b=jDO4LQ3XkufhL5PtJZ4TNhxi9cgbCe+xdtN9X+/aa62zJ6S3W9lkS5nD1xj7gc+BbQk0X2Ahb7vYHBRFLtxjGyk0dQzo1zQPHN+Ong+3rT8UW5uL5hM4wUDCirzBX0z49FSomxQ5x27kRAJlNuhz0DBfJiW5jZIzSayvZyFHcgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734451454; c=relaxed/simple;
	bh=sz4UHzE58a62cxCyjMCcMny04PWq/ObaI70WeR1H6fc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=apdX0HXu59aoMmS+8PJVt/zwhU8LYCTnxfhgA3RYsC1GQNMWBWpV8jEJWEMdDns63SHadbmuV2XajRM1J3mEwqlpJROFwh13189gxzYldGgtq9Y+8pZCTaHMhLq+HFwSW3MDdF4TMVOR42AYJweYYST8ZyFhf+KgchhUGI4ryys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=b7VdfIIy; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-468f6b3a439so13222281cf.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 08:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1734451451; x=1735056251; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=slfmR4f6JEMR7P5krJ3/zU7vcEz2d/jhP/t5zje24Qg=;
        b=b7VdfIIyGfVu9RGKdU1dpES3+JTPoQSJpPkxfFtzyIwpPKIrRY3GGKhD26byiqtTfD
         uksa+t1BPoXFHS2O9M/mVeXMwLnTXITDDX1bCOU7zq+zQ/a1X/FtSyI8ruMYzYitnO/r
         9EkEHVKBHnC7sx1euH2Vkp2PV+/zRKDnmhUdcKyt8Prn3gmGzNTOF60QLXV/nifEkm/0
         NWdWbu1RthVB0LlCPqDQ3KOnBN0Lwyv+y09QR0RFqWuEfePvbagdGY2iExvYBdbV/x++
         yNW1AYwZrqrauod3M/x502iiCFMgeTDywnCoFVvfDZy6iGZd5zpE2kXOZ59vzdRVv4JZ
         Zdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734451451; x=1735056251;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=slfmR4f6JEMR7P5krJ3/zU7vcEz2d/jhP/t5zje24Qg=;
        b=NViyI+X+BG/tAXf+m7YzNjbZ2zcDlx/JII9sxsvrPZ7bxiRfY8U4H7Gx0OStffYweM
         7q5eib/Mh3h9gd2Cm4DCIVQKU4nsjAfwLConGK6gU8KssknifodxUfrEs6gKw8mccEJl
         l3BxziQrQitACv0XyoC/+/axVns8ZZ15Od07Zw0v7o8OBYsD2Y6fzh7Wr3QXneM0B6V2
         oifguUws31WTOsinHSf2yXs9hYKf99lNMYbbRGC6i90ihKaDIu7PA03Jm2bu8X79IIKV
         61MtL2YSa+MKrRS0y3LAbU+eFoPY3qX8LxQp1axwZxKbWYh3Lzba0XTd546PqnBYRUfT
         AZIg==
X-Forwarded-Encrypted: i=1; AJvYcCXKioaFOxKLT2E4QDNd5yPklAJjLehY6qUgSs+7m/Yo3qaSjQnXtGqdWzlqs9sxmZpiBK8pmg39m4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKhD7NN60g3wvpGCCkTlQZNm/6DTqTKVE5OKpDxH2U9hS9BFjC
	QigkQ/zuP0pWl8Mcp2Wx62odBz9nHDEugtkr32v2MHGXPLQVSsYDXhMFsQOj1g==
X-Gm-Gg: ASbGnctAeEPEoJC+AJKMnZD4V+4rRlNErhcsUEavf32lgotn/NMTJBzaE31ifIwdBnQ
	Pi5ToX1tkZRywLW/gk9fXmAWzrwjYja+ddLbUUM/3VODTyQpyQzonGzGhr5GVK4N8Y3rxF0CQRF
	SM1E60sRif1XN3vhcnEA622s5SCJkN14fOmttElDf5kRjvj0Z2EMn8VH+YN2D9yaoKulEFYOUxu
	d3wftk0Az5UpwJTatNe4/AZNZ0IhaNGffB2DSQGpSnTNl3rM2Nkfti4fw==
X-Google-Smtp-Source: AGHT+IEDstIjPRnOTwY4eR6F8+qvzX9ZxamWJPa3FMKvSfy9PlDwYuMe0lIQPgYqXx+DYILoZ5yE9Q==
X-Received: by 2002:a05:622a:1a8a:b0:466:ab8f:8972 with SMTP id d75a77b69052e-467a5718bb3mr342033971cf.3.1734451451159;
        Tue, 17 Dec 2024 08:04:11 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::ba54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2e8195csm40552301cf.57.2024.12.17.08.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 08:04:10 -0800 (PST)
Date: Tue, 17 Dec 2024 11:04:07 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: INFO: rcu detected stall in hub_event
Message-ID: <fdefac3a-fa4b-4102-9c8a-4ba711beefe3@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ade3bb13-e612-49a6-ace2-bf6eeca93f8e@rowland.harvard.edu>

Jiri and Benjamin:

The syzbot monthly USB report led to this old email message, which was 
never answered.  The full bug report and email thread are here:

https://lore.kernel.org/all/000000000000109c040597dc5843@google.com/T/

The bug still has not been fixed, according to syzbot.  Please review 
this material and let me know whether the patch should be changed or 
submitted.

Thanks,

Alan Stern

On Mon, Apr 08, 2024 at 12:55:13PM -0400, Alan Stern wrote:
> Jiri and Benjamin:
> 
> Tracking down an old syzbot report from over four years ago (but still 
> not closed out!) led me to this email thread.  It turned out there were 
> two separate bugs involved, one of which has since been fixed.  I don't 
> remember the issues very well, so here's a copy of what I wrote back 
> then:
> 
> On Mon, 09 Dec 2019, Alan Stern wrote:
> 
> >  The big problem is that the parser assumes all usages will
> > belong to a collection.
> > 
> > There's also a second, smaller bug: hid_apply_multipler() assumes every
> > Resolution Multiplier control is associated with a Logical Collection
> > (i.e., there's no way the routine can ever set multiplier_collection to
> > NULL) even though there's a big quotation from the HID Usage Table
> > manual at the start of the function saying that they don't have to be.  
> > This bug can be fixed easily, though.
> > 
> > The first bug is more troublesome.  hid_add_usage() explicitly sets the 
> > parser->local.collection_index[] entry to 0 if the current collection 
> > stack is empty.  But there's no way to distinguish this 0 from a 
> > genuine index value that happens to point to the first collection!
> > 
> > So what should happen when a usage appears outside of all collections?  
> > Is it a bug in the report descriptor (the current code suggests that it 
> > is not)?
> > 
> > Or should we use a different sentinel value for the collection_index[]
> > entry, one that cannot be confused with a genuine value, such as
> > UINT_MAX?
> 
> Syzbot tested a proposed patch:
> 
> On Tue, 26 Nov 2019, syzbot wrote:
> 
> > Hello,
> >
> > syzbot has tested the proposed patch and the reproducer did not trigger
> > crash:
> >
> > Reported-and-tested-by:
> > syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com
> 
> Here is the patch that syzbot tested:
> 
>  drivers/hid/hid-core.c |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> Index: usb-devel/drivers/hid/hid-core.c
> ===================================================================
> --- usb-devel.orig/drivers/hid/hid-core.c
> +++ usb-devel/drivers/hid/hid-core.c
> @@ -1057,6 +1057,8 @@ static void hid_apply_multiplier(struct
>  	while (multiplier_collection->parent_idx != -1 &&
>  	       multiplier_collection->type != HID_COLLECTION_LOGICAL)
>  		multiplier_collection = &hid->collection[multiplier_collection->parent_idx];
> +	if (multiplier_collection->type != HID_COLLECTION_LOGICAL)
> +		multiplier_collection = NULL;
>  
>  	effective_multiplier = hid_calculate_multiplier(hid, multiplier);
>  
> @@ -1191,6 +1193,9 @@ int hid_open_report(struct hid_device *d
>  	}
>  	device->collection_size = HID_DEFAULT_NUM_COLLECTIONS;
>  
> +	/* Needed for usages before the first collection */
> +	device->collection[0].parent_idx = -1;
> +
>  	ret = -EINVAL;
>  	while ((start = fetch_item(start, end, &item)) != NULL) {
>  
> 
> The second hunk, addressing the first bug described above, was 
> implemented in commit ea427a222d8b ("HID: core: Fix deadloop in 
> hid_apply_multiplier.") in 2023.  But the first hunk, addressing the 
> second bug, is still outstanding.
> 
> You guys undoubtedly understand this code much better than I do.  Is the 
> first hunk in this patch still required?  Is it a correct fix for 
> handling Resolution Multiplier controls not associated with any Logical 
> Collection?
> 
> Alan Stern


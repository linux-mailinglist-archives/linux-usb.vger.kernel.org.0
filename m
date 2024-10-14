Return-Path: <linux-usb+bounces-16188-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 590E599D41C
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 17:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03D4E1F24771
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 15:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6406B1ABEC7;
	Mon, 14 Oct 2024 15:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="B+gVHf1N"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9ED1586CF
	for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 15:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728921577; cv=none; b=EAXXkjOvHQTjYa4xgzJ01o6AJnbdxjQ0lhXobIGijXnC9afGd7Q2uPuKsFkPhLwxrOPjhp6mHBDldqwZH8en82uW7BcF6pm6rREDzkxIr6c1ltYad8W29a1kJdPdtKOSCLe0sQWmyBnli/PyNeguPT0FENCS7e9P4xOaDyYAitg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728921577; c=relaxed/simple;
	bh=ACLKrTH0YpItANlVodfnX3sNPabEH4JgAxp533X1hoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fCMMRCfyS5+L7zKwkBUNnNBxfjKj96CiAWHMSSUET+a8U3sd1O5dHRcazLBINC1E72xaXU8xDrKaNGkAST5AafOp8dDix9kdauskKUe1u+LmXZstFCZ6D2oCuer2Bv3C7Ai/9KI708w2WmLb8W989zVKJbmTHqBWtM2Mc+VF+2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=B+gVHf1N; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b10ed5e7cdso509381085a.3
        for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 08:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1728921574; x=1729526374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DYEwaWa0z+lrJLi2rF+V4VJ/LyglDXOo4OWiLT76ZaA=;
        b=B+gVHf1No+CJJU3x/Wq2WP9xaz15Bl6No5slaQQMz5I8/x3fwtbkcZu+haPkwvL3mc
         oIdl+9SWAsuCzSyu1AxTKx7DR9eaGcmW9Atl8ROcPFjwYnIx8hdsMjj8CATVZj35T6VI
         QlskFAD43WmVesvPQw4qFY0ut+uVJDvr87xmBRoWhbFIoxSSW7yD6ka4uOLtAxo1h4/U
         Ipx6vNKzh26CXNzj70mQp0kNm7fDBQW2vYZgrsYYFUzQXkbdmCTGkguXsvGOHqgReNMD
         jlqcIVgWl30KygKj5OhHCGpcXF3xwkAGa87nIcwP1ZCvfCxVcwKM7nuCqzMax4gfeHC5
         5kLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728921574; x=1729526374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYEwaWa0z+lrJLi2rF+V4VJ/LyglDXOo4OWiLT76ZaA=;
        b=sjqiVELPoXmjtjp4/EEtcz7dqLHPra0T8+vD7WD0iFW+T6PqrpEfpam5jWf1eLOXni
         f/DhqUywVuleeWgtT7lqjan8ASmYa2EQzkMExlubLoDcNeNZlJ0Ekoi+h8Ai2EAucDkS
         ZVGVN/FeKXD4W21FnG2byqS0/VdK/HTtt8RV26wSbtJrCmfgd/T5DXT8ctLX9APjwdf5
         93F//vVhOMI3u0z1jTLyiW+BNB1QHsOC+OPVpl3UDE5l1BumHZyLB4sDGbXnxhgHXEsd
         FeYjl9kJ7Vxa1TPoNAuZzKyHeum0mhyt2Hl0HUOn44ElinORD9I+uArSkTyS7VmTn5ZS
         jTtg==
X-Forwarded-Encrypted: i=1; AJvYcCXya44ujTFBdaUzo9mPZQQF40UTnDk+Gf/hKVTF+/JEO3mPm+RpRO6meRjcBLlcsHRFDvGqcvzhYMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGKWSbqcuvTfWjVwPSkhKChLegBoTy0uAC56/iYYFjLTqee7dF
	azOypySZvuD0fO6dT5snNZAUXZ70z6DfgRP/lmvfLto0aCR58d8Kd24WCHsmmg==
X-Google-Smtp-Source: AGHT+IGk9Iq10RUI7wajW08xEovbUpvwwWPSJ+bZFAENPk+W+Aajopx2jMpYWRV1Id4tTpkgx4xJHg==
X-Received: by 2002:a05:620a:45a4:b0:7a9:c8a1:5d92 with SMTP id af79cd13be357-7b120fb7a61mr1551756485a.16.1728921574487;
        Mon, 14 Oct 2024 08:59:34 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::c666])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1148fa3ffsm431710385a.69.2024.10.14.08.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 08:59:34 -0700 (PDT)
Date: Mon, 14 Oct 2024 11:59:31 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
	mathias.nyman@intel.com, yajun.deng@linux.dev,
	sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com,
	dianders@chromium.org, perex@perex.cz, tiwai@suse.com,
	niko.mauno@vaisala.com, andreyknvl@gmail.com,
	christophe.jaillet@wanadoo.fr, tj@kernel.org,
	stanley_chang@realtek.com, quic_jjohnson@quicinc.com,
	ricardo@marliere.net, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	badhri@google.com, albertccwang@google.com, quic_wcheng@quicinc.com,
	pumahsu@google.com
Subject: Re: [PATCH v5 5/5] usb: host: enable sideband transfer during system
 sleep
Message-ID: <fc6361db-558a-4a8d-9304-ec53c7262451@rowland.harvard.edu>
References: <20241014085816.1401364-1-guanyulin@google.com>
 <20241014085816.1401364-6-guanyulin@google.com>
 <9b5fe5d2-77a7-40b7-b260-856c35d9dcec@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b5fe5d2-77a7-40b7-b260-856c35d9dcec@rowland.harvard.edu>

On Mon, Oct 14, 2024 at 11:56:40AM -0400, Alan Stern wrote:
> On Mon, Oct 14, 2024 at 08:50:29AM +0000, Guan-Yu Lin wrote:

> > diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> > index 1ff7d901fede..9876b3940281 100644
> > --- a/drivers/usb/core/hcd.c
> > +++ b/drivers/usb/core/hcd.c
> > @@ -2593,6 +2593,7 @@ struct usb_hcd *__usb_create_hcd(const struct hc_driver *driver,
> >  	timer_setup(&hcd->rh_timer, rh_timer_func, 0);
> >  #ifdef CONFIG_PM
> >  	INIT_WORK(&hcd->wakeup_work, hcd_resume_work);
> > +	refcount_set(&hcd->sb_usage_count, 0);
> 
> Did I miss something?  I didn't notice this field in any of the earlier 
> patches.  Was it already created by the prerequisite series?  If so, why 
> didn't that series do this initialization?

Oops, yes, I did miss it -- it's in the 4/5 patch.  Sorry.

Alan Stern


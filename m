Return-Path: <linux-usb+bounces-34117-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBNxLKSpqWlSBwEAu9opvQ
	(envelope-from <linux-usb+bounces-34117-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 17:04:52 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D3621517D
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 17:04:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4F583304201C
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 15:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106443C6A27;
	Thu,  5 Mar 2026 15:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ISrTbKXR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510303BA259
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 15:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772725680; cv=none; b=pDs8HYd5oeOxHQwXcWXdWKjiM6nkiqlUzN/5qZxW5rTSDUUMJkPp1UgKGQXkuG5OTy2UurbM0jYoADYsgwR3mW6gNuy9XCC0XJq+A4aoI7Ose3r5dkBVrcqx8ev591lqzy7Ac/qZ+QsWnpL+2wdH3xcXko802fTzdoqx8Xf4Wro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772725680; c=relaxed/simple;
	bh=8cJHgdbKxrkm2+66tHARPeIMw4/HQWrbzP6RxeZN95Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=plQgNbPmz0ss2PKpMuAtTeLsJhe9N+pyHVS+VjsKMH0UG3Js64VmVLS54ijs8kaLm3zrUX71kJiJkM7aFxuV2MFbpbiNjaPXvLa93S7CbylvKeMkbFHLZSa5KjPnK8XybR6OkTl0z+tcKF2WSSknXRkTLG1eC/iIP5aRl6ptQis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ISrTbKXR; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8c9f6b78ca4so1071547385a.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Mar 2026 07:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1772725678; x=1773330478; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+93b4rncmSMzYKKF9LRnkkK5vmWko9G930mePvUh1Z8=;
        b=ISrTbKXRC+1RuI1F95G6br/YD7yXggkdgPEHK0hJvILYJ3S3KzlySI3fS/mFiaTjcE
         +m3I3+q6ptc5zuMklJxZAiU8FsdF1M9NqqN1TjOB4PifveCRg3ElcIg/qpEJgtsWkxj5
         bc4vb++Ij7iEZeBncOAhM4GC0D50/ATcaEavO4BU9Ghh1nvMgWWjM0vdJKrdNizSktAj
         ll1vUPi2HKJF4ie1EQKtN3h58gOMf02+Xp9QsG1MMfKXeIUBS2HqEclYNNkalMqFuUdl
         KwTEA01zXlHaVjO21FIT1txjXP7pyZf0+ClKzMwvoIj7O7Rq3dqOXfsgdblVZZGynVPy
         jZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772725678; x=1773330478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+93b4rncmSMzYKKF9LRnkkK5vmWko9G930mePvUh1Z8=;
        b=Sgr7jKw1Cu2Ot32jJEr+WYXNpYIMJaVqF1ldSFGxIChxR4Wf2muJ7eIbd/IOlgdZg2
         561kt3RGGByn2PSdWYdnJ7xkZE3Y+vI3VLRg309JVyvtD72bPsw/E2oXx3qOHQAAOZy+
         d455p1ojn0JqozkDNHhWk3Bte3e98UsMxSxgZl/JAPitkXdsrrHnf/LRLuykcKbrGK/9
         1y6MgquQmSVwmqejGAx+L9I1KZFE+mTT5Atc1OCvBLUe7k1qrzaZyhyramurOmf0ko54
         +T8d3QSuWiCR2P2yiPt8Hx67vzq+STDNCYWXlGK+MfyG/BDXbiPL+rCFSBm1DvgvzqWf
         F+JQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2dlWrH0x6RyKyxKBCj23pyOYjqXE9o4xfTe0itStW8g2evfgQdsoQGG8plxZaI8APa6+JbR2iWDg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK2UesMpuTjQXMyfn04m+GEfgvTI4uOSJ+ue2jAD3CMG0aJFaD
	4AlWHnxay7ozSpT4gGDZXL1DKFaUa2NFBjjEP6ocHpwyIo/ZqbuXK2pl9VkSUjw3bg==
X-Gm-Gg: ATEYQzznSMbzxUGEJLor2EyIR3r1HeqJKsou/p9kc98J7eb1X8R4v1ZLJsW/OTIGsNB
	ntm2bdh5YZKmDofWRpC2n2DL0XUohfV5m/e+P+jNYWuqU6kE4rCV6L+mX2x6XRuif2K7T7RYj5X
	oVSNMNOUc+4W45Fe8rxyroopBnzPjPVRSzUYx/bgwNi4Sg3nmnqG7+0dkfX/lzpsWqib/SN/lgF
	dzz1VhG6PCbjsTr3kLRz5bu6Qdg0u3Yl3g1X/XqZAvSmolYXHW9sGXO+PhvdKIMKIA2n1Kt4IYx
	EYSsHbOLWtCaaVG50KYOvC7sBVgBBLV/Ki9cgTj6/5i9Qtwq+inUVPaohnRH6SdtFXbAa5s9dti
	+w3W8NkFwke+2J6hd4qJn2VezFBrTAfnHBWJcHZxi78dO4TE9DV7kzxhDKrwCpPiCHXadyqfG5f
	P73HAAw9QhElMj/FeZLprTVEPH7yQEvwJSxFdya38CwQ==
X-Received: by 2002:a05:620a:1922:b0:8c7:f79:bd70 with SMTP id af79cd13be357-8cd5af7589dmr797306385a.44.1772725678084;
        Thu, 05 Mar 2026 07:47:58 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf72d3casm1937310085a.42.2026.03.05.07.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 07:47:57 -0800 (PST)
Date: Thu, 5 Mar 2026 10:47:54 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, gregkh@linuxfoundation.org,
	tglx@kernel.org, mingo@kernel.org, claudiu.beznea.uj@bp.renesas.com,
	kees@kernel.org, bigeasy@linutronix.de, ulf.hansson@linaro.org,
	rafael.j.wysocki@intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: hcd: queue wakeup_work to system_freezable_wq
 workqueue
Message-ID: <b5a3d627-8cc5-41a9-848a-1e67c96bc191@rowland.harvard.edu>
References: <20260304115729.857136-1-xu.yang_2@nxp.com>
 <c35d4aae-038f-428c-9b69-09230043dd60@rowland.harvard.edu>
 <dia6g5nbekt6brmi73dovchyklugjnd6ok3tsifbd6nfcjnnvd@xus2sw5wodhe>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dia6g5nbekt6brmi73dovchyklugjnd6ok3tsifbd6nfcjnnvd@xus2sw5wodhe>
X-Rspamd-Queue-Id: A0D3621517D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34117-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[harvard.edu:email,rowland.harvard.edu:dkim,rowland.harvard.edu:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 03:18:29PM +0800, Xu Yang wrote:
> On Wed, Mar 04, 2026 at 10:24:09AM -0500, Alan Stern wrote:
> > On Wed, Mar 04, 2026 at 07:57:29PM +0800, Xu Yang wrote:
> > > After commit 4fb352df14de ("PM: sleep: Do not flag runtime PM workqueue
> > > as freezable"), pm_wq workqueue will be unfreezable during system pm. This
> > > brings issue as below:
> > 
> > ...
> > 
> > > The reason is if the host controller resume routine xhci_resume() call
> > > usb_hcd_resume_root_hub(), wakeup_work will be queued and run immediately.
> > > Then usb_autoresume_device() will be called and usb device will exit
> > > runtime suspended state (if it was suspended before). For a hub device,
> > > hub_resume()/hub_reset_resume() will be called accordingly.
> > > 
> > > After the host controller device system resume is finished, the root hub
> > > usb device "usb1" will do system resume too. Then hub_resume() will be
> > > called again.
> > > 
> > > Above sequence will cause hub->urb to be submitted twice. To avoid this
> > > issue, restore the previous behavior by queuing wakeup_work to
> > > system_freezable_wq workqueue.
> > 
> > I don't think this patch is an appropriate fix for the problem.  One 
> > indication of this is the fact that you have not considered the reasons 
> > for making the runtime PM workqueue freezable in the first place, as 
> > described in the 4fb352df14de commit.
> 
> Making runtime PM workqueue freezable is to prevent runtime PM tasks from
> interfering with the system PM tasks. We also don't want usb wakeup work
> to affect the root hub device system resume process, right?

You're right.  My first reaction to the patch was too hasty; I 
apologize.

> > A better question to ask would be: Why does xhci_resume() call 
> > usb_hcd_resume_root_hub()?  That does not seem like the right thing to 
> > do -- at least, not in this scenario.  The proper time to resume the 
> > root hub after a system sleep is when the PM core calls its resume 
> > routine.
> 
> Good question, it seems like commit 79989bd4ab86 ("xhci: always resume
> roothubs if xHC was reset during resume") is added to fix some issues.

The changelog for that commit says that it was meant to take care of 
problems during runtime resume, but it also affects system resume.  This 
appears to be an oversight.

> I also find ohci_resume will do the same thing: a8b43c00ef06 ("USB: Fix
> runtime wakeup on OHCI")
> 
> Assume the above fixes are necessary, then switch to system_freezable_wq
> should be a proper fix. Because this just restores it to a previous state.
> Otherwise, the fixes need to be implemented in other ways.

Yes, okay, I withdraw my objections to this patch.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern


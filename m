Return-Path: <linux-usb+bounces-34142-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IxjBE6eqmlLUgEAu9opvQ
	(envelope-from <linux-usb+bounces-34142-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 10:28:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACE821DE98
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 10:28:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B293F3033D0D
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 09:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DEA3446AB;
	Fri,  6 Mar 2026 09:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="czUKIDIz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3482E3254B3
	for <linux-usb@vger.kernel.org>; Fri,  6 Mar 2026 09:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772789112; cv=none; b=HPcOCxG7iPqo2qswikkIVxlVNF0quaKP3kZ3m1CVX041oU7n3+2it6szmCEZJ6y2gyVToaRf5v9T8l+R8w3Vzt9UUPnwyiO1qSzKzmO4zF4uVoyYtncBWewMypzyz6SxN27AhxKtWL3Nm5Klq2CbZLRz7w43yXLV29FeehJx23c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772789112; c=relaxed/simple;
	bh=qc/wfNv2DTKb76yxe5ZyszbHya3/TD9RtaoQuu2WRgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NSFTPBKqdN0DjxqvmcgD7flZ1xyn0YF6/MuoeJSNZqtHSm6kVsXtqnHXHK3eTyPXl+xs5nJDyoNjsnSpdYZ9XUW2Xd08cZSYbveHDjnF23nBTpicaIBFMfVVLeur+lsy4u2ieiTpYyBckUfvyvUjJBEra0MIqkza0oN7dfXJWh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=czUKIDIz; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439aeed8a5bso6101718f8f.3
        for <linux-usb@vger.kernel.org>; Fri, 06 Mar 2026 01:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772789110; x=1773393910; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XpDTsDoV5+2uhsQojcrRuu4Kg/PPqTfqWkMZuczO8W4=;
        b=czUKIDIz+dwxfCuTS54jRghmOXZHDwzu1zw1Sjen9tN8a5JZWQOKvkmvMXPcFhX2J9
         K/MB+6A/x1rj7fPCiXBjz3GH2RkQnWEQvCQDHY9vDwgp8PGaH6sG7tbNtSiE4YSotVaA
         5bKjggQuQ22oWSsufbwsLqb489HdJ6SgqPxlgMDCXQCvCzvEglZ9LRU9STrtR94Tlf+I
         lBHTVDH+qemG6t3UsLPlL5GFYKL4NQyD9Dbi0PGqmHnUEW5UcWoH1Oz6U7vgGbejjlMg
         Dis9xBhqdofXhcqUe+DXzoxQ0qwc7F7wToPy/e6rG0pFdPGeL+djmWVPXCuYC0aX4PQ3
         7sdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772789110; x=1773393910;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpDTsDoV5+2uhsQojcrRuu4Kg/PPqTfqWkMZuczO8W4=;
        b=ZprDm5Lj/4M/XA00jAlqFKIqiNRvZWsRNYdZD20kOXHPh33ONKmVfj/jEjoz3jwAMh
         jVl7JgsTUKDv1kjxMl9mpRDG/MRyF0mSuCv//PjpwVtX7ApqHiqwD7VnS4lgsFlPYOeH
         imkgMmWGWnXYBZ1YfI3ZmjdGRUBd6Tt0MAKlTnUYCiZwhyp2KtlJrcn7bxL2ANBrQ7wu
         BHo3NBw1EGR7ymoq/hsNgDcku+mZKznBAHj3wUMH+XLOR2iU/jjYuGKsrL9lAxnm3KCI
         EuAZjuJhMtWX1nj3jvfWM3S94pCw6eXIxCrML3xrZSHlR8JEqKI8NigHwaO5ccJyU76h
         /96A==
X-Forwarded-Encrypted: i=1; AJvYcCUVRvAE1Cu5Bbsz9ALusxDVv8nQmthCU+Xv/AjnOxsff05s9EG+QntlnCS/WSei/I3smPe8W+Pkhb8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4qd/o8DZUMs2IukQvzHbcwJzbwXJtHlLBrRm+2N7Vy50wA5sb
	esyQTunbMOGB1+jXon9lYhszn0/Y2HYC7fFdofX1tJZAZN6KlN0fktIivrtz0bt3cru0mL16HLz
	QDPMu
X-Gm-Gg: ATEYQzy+aYe7oM2ScknaRBAIGeFEOealg5WH2E18cidxi5cWBkqSMnwcTUotZPiHKzE
	1MSGpE0Q7UYJssLYnO02f50kORpEw0qv49N0C0BH40gHUIKQ0m5wtYDoUD7/YReuh+t49ODsBXZ
	rlygRr9Jebhd3Qim9NsqfMvMS8AUcOg5i0QirqhXnDW8wpKzSd0Sdqut07AgRQpcxCV6beBFws7
	c4zXtkZOXXGeE0GYDI4IeuwayXoU89dgusiu15oLy3Y7X4DrmOzvruUxQ1LU2h7u/g12gO4Kfls
	VFPFo0zLO/n9a9R4XvSfORd4PIeINIRdMR1XXNMaaE2q+QgYaCt6OUZbQCvn1nC8FlEPW23GVMn
	z8s8Gju8epSzyTBGFxSsJvu6ZpwJ23llDLOGtQpFkc/YYifbbP28E2zCT5GpSH5JdxD1emLrOaR
	fSrrh/RG8kc+Pb9WQ8HYSUZcmqwxvhojcLvBaL3RJFDefds+Fcj7epYUO+hwEGbiRi
X-Received: by 2002:a05:6000:1846:b0:439:ccd7:cdfb with SMTP id ffacd0b85a97d-439da89f0b4mr2343398f8f.53.1772789109493;
        Fri, 06 Mar 2026 01:25:09 -0800 (PST)
Received: from ?IPV6:2001:a61:1372:501:2753:2852:68b3:61d5? ([2001:a61:1372:501:2753:2852:68b3:61d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8da01sm2796386f8f.1.2026.03.06.01.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 01:25:09 -0800 (PST)
Message-ID: <6c70210c-e437-420e-a1ee-fab44622aea3@suse.com>
Date: Fri, 6 Mar 2026 10:25:07 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] usb: cdc-wdm: Missing barriers in ad-hoc lockless buffer
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, robert.hodaszi@digi.com,
 kees@kernel.org, linux-usb@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Jia-Ju Bai <baijiaju1990@gmail.com>
References: <CALbr=LbrUZn_cfp7CfR-7Z5wDTHF96qeuM=3fO2m-q4cDrnC4A@mail.gmail.com>
 <f8c304be-c061-4656-b7ba-83150c2b8746@suse.com>
 <CALbr=Lb6Vir4+O-=8-iL7M8=Gqgm=VUp6s+XGVC75QixFaSmOA@mail.gmail.com>
 <678e1fc6-356d-426a-aec0-f0bf46c7d3af@suse.com>
 <CALbr=LZVqqYmV_1qZvh2-5pizrkDE=kqUW_Yb6GWPu65gVFnLg@mail.gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CALbr=LZVqqYmV_1qZvh2-5pizrkDE=kqUW_Yb6GWPu65gVFnLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6ACE821DE98
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,digi.com,kernel.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34142-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action



On 05.03.26 14:26, Gui-Dong Han wrote:

Hi,

> Based on my shallow understanding, reordering issues typically happen
> between different memory addresses, not within the same one.

Nevertheless, you've found the issue, hence I will ask you :-)

Is that something we can depend on or is that just how it works
on the architectures we are currently running on? If I go to the effort
of checking for reordering effects, I want to do it right in all cases.
   
> The real danger of weak memory architectures lies in accessing
> associated variables. For instance, if we write 1 to int a and then 2
> to int b, another CPU might observe b == 2 before a == 1. This is
> exactly the situation I pointed out in my original report regarding
> the lack of barriers between desc->ubuf and desc->length.

Yes. Hence I was looking. The results of a completed IO can be

a) data
b) an error
c) a buffer overflow

thus there must be ordering between recording any of these results
and changing WDM_READ, right?

> Honestly, lockless algorithm design is incredibly hard, which is why
> drivers should probably just rely on well-tested libraries instead of
> rolling their own. I am definitely no expert in this dark art, just
> know enough to be dangerous :)

I agree. The issue is that lockless IO is also error handling, not
just the buffer.

	Regards
		Oliver



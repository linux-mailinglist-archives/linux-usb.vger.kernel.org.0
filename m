Return-Path: <linux-usb+bounces-33672-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qdhWCiLvnWkHSwQAu9opvQ
	(envelope-from <linux-usb+bounces-33672-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 19:34:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E38D18B72E
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 19:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CCBE3302D6AB
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 18:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9EDC2798F8;
	Tue, 24 Feb 2026 18:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Y1KKXyAT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0602D8399
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 18:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771957965; cv=none; b=I/5vDRtrQAb9Bg7UXDs2RVBpl28zBYxok/hxgKiTnO0cMz2y2mw9cIeJZcyJRUP4fYv0LEEPpO+xbxriRiwimQizNvJdCIs1/yUJ5gUDe6T1S3CO4mgruGfFWUCEwYR/zcJm4DIoSuvGRFCoidnpj2NiXDd+zYhf4ekGt0C9Nt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771957965; c=relaxed/simple;
	bh=Q6abp5P7AL1QnTTKA3pK+7fWno23mILTZJIX9noby+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lY+GKGdGIEd1IPF8OaC1ZxCSogkWiQQ7jUuPyIOvt/lJfaBe0iSdOC0bRR+/Cubc06ZefrDc9F4c6fKR3iAkLpzIVfqW8dwdtVESsGdSbbFeT0axPWrIy0eZENGuZurnZlrLU8m1CDqjdRJDiLQZURnc7lyMIJgiMA+RsujLzy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Y1KKXyAT; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cbb2329e7eso25175085a.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 10:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1771957963; x=1772562763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wNdyHTYRQWX8PviAnaxTxE8GNiU5QYiAX+yevkUJwSU=;
        b=Y1KKXyATNPd4+GCjPdRSINnwlfdNNqztUeJSOeJgc+c+U307I2dD5RKhGGkDrZ9l/C
         9s8WvfPmo/ZIZdMWeiBYHUoPPGXoAwetYKnrg4qEYD8ZByxIXTAx5gwQLnGJ5anjomJ/
         yIvIoI+TJcF49UBLZKIE+czu2pEJ9Qjs2HISsTZ3Km3kaFQmM7PXUiiU7CtyRtT6Frpu
         6DtC2SpmzptCIdMrHvOk0T6wnnuKMzPeQ6EgvelErI79CsdwlYi8q4YYsrP/9GzOLyjZ
         yWvyW9d5kUgK95Z7+dRxwJUc/XQL14n61mTUZsoXCp2UlMDVMKUWl4e83AHWtfTL2wFN
         ahuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771957963; x=1772562763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wNdyHTYRQWX8PviAnaxTxE8GNiU5QYiAX+yevkUJwSU=;
        b=OSMM4LIt1VQcjmcwhuRo9q93geu5czpvUyNpGuDYy8gG15grWp+PRvgYqIfAtAU6pM
         1e8gCb5QhUXbP47II6MhBnCE0f4wrcnX16c81WpYY59e5yeCxgbv1ITCfj+7UySLVFkB
         i+o5rksW15w4WHCOyP/aiy4LTlC1ut8uo1W/v38NWJN7Vr2l/JzcTortdzUFz+w4CtHe
         2cEn4uebLjX4VDWWCK5kFV/DUIYYnfV4xscmjNhr66jSYCmBi66zknacK1iHy+PQPCPJ
         UpDYKMq88p7D4ZRZhSdjUgBHQ6iu6ElqxSux01tv5PvckZw6gTU/tk2nPt8AwIMLuLJK
         FCpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2UEmqQ6AfqHEm+riPICxzmSvkHwo23COkRP18GFjJNW32TNPzyPKl9dULeddRQJosWC2nCK75YIU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSYxxY//UnnmDYVmCGe0ry35hkSVFyvnjyEEVlmwEQ+eo2UcVK
	fkwK4r9dSUYh+ROADX5USEkLFpBQ6ACYYrd5pkkLuADFc2h39yytdrr5g+YbTR7JGO1mTdNjubI
	STBY=
X-Gm-Gg: AZuq6aIaOcjvFM5IdxvnIAMSN+p1qIkxT2LZk7+ULiCnY9YDXV3u8As+N4rc3QfTcxZ
	eD4L0xgg6bajYM6POjxYiKqDElpr2GW78vRcp2E7H8rwNZNDiHlyPFtrrcnQYEJ6XH/sLN3fLLF
	NsS9M73hjAKwWnqNBWuMDmKRaojyPTdVUbPJropEF+tWI4mYZEts1nCxSwYyCm7fyl0G+utsbrM
	QU/AonHtiYbcXWaMVq3XmRcKr9U5ICGkTPLavlqtUYZNdRXGY701MXxUGPjjjO2x5GbxOicCvJv
	FcSg3b0o9ybyEZZYGTBUAgpUOwJSqTlfyYrRJd8PREDsDIwYKd9qhX2gWaAo4XZJFNQhwkq+Us9
	BrzyWhUcUa1NHt1o2JqsOu9yY0HlgQoNK3Wq3xzTPcynduPueV1Yz0wSqcrmsNU74zMTNVsujf9
	c5KdbeST9H4fAaWAWw3/IqsngWhXm4Iu3Q6R4=
X-Received: by 2002:a05:620a:294d:b0:8cb:4066:7acc with SMTP id af79cd13be357-8cb8ca6e705mr1732176685a.50.1771957962967;
        Tue, 24 Feb 2026 10:32:42 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d120e11sm1042493685a.49.2026.02.24.10.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 10:32:42 -0800 (PST)
Date: Tue, 24 Feb 2026 13:32:40 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: further issues in uss720 disconnect()
Message-ID: <30e15a19-275b-475c-b132-39d41b825189@rowland.harvard.edu>
References: <00b407f7-9adf-4666-bfc3-3c4fbbf7dce7@suse.com>
 <33708317-1a17-4d44-8dbd-423902db335c@rowland.harvard.edu>
 <3ebbf02b-8c55-41ae-90f0-49247aa14f3c@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ebbf02b-8c55-41ae-90f0-49247aa14f3c@suse.com>
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-33672-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,rowland.harvard.edu:mid,rowland.harvard.edu:dkim]
X-Rspamd-Queue-Id: 3E38D18B72E
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 05:06:58PM +0100, Oliver Neukum wrote:
> On 24.02.26 16:55, Alan Stern wrote:
> > On Tue, Feb 24, 2026 at 11:29:42AM +0100, Oliver Neukum wrote:
> 
> > > we see that it will happily access kfreed memory.
> > > 
> > > I think the driver needs a wait queue for asynchronous requests.
> > > Or should I look for a way to use usb_kill_urb()?
> > > What do you think?
> > 
> > Another possible solution: Keep track of the number of outstanding async
> > requests.  Then take a reference to priv->usbdev whenever the number
> > goes above 0 and release the reference whenever the number drops to 0.
> 
> This seems a bit complicated. Why not just get a kref in every case?

You could.  On some platforms the atomic operations used for krefs are a 
little more expensive than an ordinary increment or decrement.

On the other hand, if async requests can start and complete concurrently 
then the counter would also have to be atomic, which would remove any 
advantage.  (Unless there's already a spinlock protecting everything.)

Either way, it seems easier than using a wait queue or work thread.

Alan Stern


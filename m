Return-Path: <linux-usb+bounces-33010-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MXLOm3MgGl3AgMAu9opvQ
	(envelope-from <linux-usb+bounces-33010-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 17:10:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A791CEB67
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 17:10:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 210593002D00
	for <lists+linux-usb@lfdr.de>; Mon,  2 Feb 2026 16:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB5E37D134;
	Mon,  2 Feb 2026 16:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="T/aF7pW4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7551E37C113
	for <linux-usb@vger.kernel.org>; Mon,  2 Feb 2026 16:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770048574; cv=none; b=AR1D4UMLG0SER2v44nfakli1R1MZkhvdw7xCh7GwhPICPKokiZMzCwts9c8a2UKbEVrHMjNAWp2mA6tfKSsvVQyv7KnbAUolSRkXlF/Dg6o+9qs1ueEQ7gPs1EJbx25HfFONCBD/xP4071WMyoxUB3s4ONrr3y8AtU/ua0XOxnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770048574; c=relaxed/simple;
	bh=HAu4DKcmCn9jRLj+0mwc8/nFGBytGpJStHcpa6gpDB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfEOMjRvYlQciSMc9wNtyoiX6q/VG3qQz5iB9paKedMDmr7X1yZkxgg4u9E+JCXcxJVAQ9fTXfAl9Gruf+XGXJZHOkXOrjuMGDe+OLQYFE0teBL8ZozQ47ReoxyHxECQnrw3LCQj4FFi9XVKUadFxUL/25G97TK/s/hW/tTOu0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=T/aF7pW4; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-502b0aa36feso49544141cf.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Feb 2026 08:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1770048572; x=1770653372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r+NROkACJhEmkOXCU3jerkpj3wRhMMHpRt2F5TFK3GA=;
        b=T/aF7pW4sCXpmiC+JSZEj181I01WGd9DdwvMa/biourGoJwoxYiTejaAe0PrAE0crc
         DKkkwS8IHycF1FqUp9ucbeTe7lMPTVOy0Q2AqmJN8ZCqxrgxFVvErhAmRKJzYDpkaTS8
         /eepTS8JJVYx48oKrjG1w5vvjs9kH35RhEqFbD6F2OFfyrwSr5K+w0ts4S8ukLuQ1Q4n
         DU0iNtp8gjMHnlcuBhVkL3IdyrfPRy0EMp+cbVI47Wx60foddVISLXJwJ5bhMD/sa166
         xG/UWzFawsQ6qosapkTYWb2ta992J+V8ADuCpJBlVgCJdfpi7z9guiGWeUsAjyfYb94A
         O4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770048572; x=1770653372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r+NROkACJhEmkOXCU3jerkpj3wRhMMHpRt2F5TFK3GA=;
        b=bxCCYxkwsOH0IVm0kpWIqAXXS46SowkzHBlS+ef1Z48uhArHn0xlxf+q1z3TgaE5wL
         pBfBwJmlc78RSL1UwGXRnwNz0DkBN4mRsiAMTrBjd7eeGJx8vw4cOm1PZKbkUA1umShu
         1clxzawaC2xbybVqILr8icAtg1WC8B/CUly3uyM/5AvTG9zhcSTaH84dj0GoDPk8m81u
         GdH9GNeXfnSiRrR7UyHX6ExHWNnUANmmmYUMxbiYSeA/B5zQZHh9lyk/Z4YD40CCQDG5
         Zk2i5156BVPqolf3v6JNYxroPggPGxEf0DTGhY7n6CjvJviC96b1FeD7JQJlNehtmMPx
         ybdw==
X-Forwarded-Encrypted: i=1; AJvYcCVc7qNaB0AtLDWgg6eg73/aPVxGC0W9n0O2RZa/iI17zH9jdwVQQ7znyWQCzEzUnt9adRcEqmabkkA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7vNdfTxU+4rxYhIj+yiQiI7K2wkvo90A7ULoTrKYGIHc3XKlY
	g8IxZ2/5lI0DLzcGrf1t8aJVR7fmDjKjszHSHZnUomysxYpFUW1o+sbdScxoivb0bQ==
X-Gm-Gg: AZuq6aI1S1WAnP0CufEATjC67ctkI1dAON++L8Ci7BSgNEdzkBopXa2XTkWJc43Z636
	rfDLPP/1rS7aDkRWddTUcMf9iAjpf8K3L0wBWrjoURpR1yjju/SylwYCfhY+4Q+C7FbuLAXfKTB
	bzR9aQTY3Z9q9zQS/WVqaQ/f8l1gPaxXKy4+yUxDFkJde+wdvLTvqhisLZYQn7K60/mDjybBh0b
	qTeR2XtCNL6UTq8hh7b9wzSVDi7ensQmqPW84dduHupwaay3jdCGkVneLwRVtyCdJ9Wy558ru/X
	/vFyBiT6OlfQkz0xx9dSwmtPXjyeNYgui3T1gVwAHgkUryHJ304n/2tOhZIsrnqd9bUL8/wyNml
	BrVXFPE4/Mioi1dSgCB3y1Wg7Ps5ThieFWSo6m3X5B/gHpJHi/7ZdZJ9RogsVqxZNp56F7r3IuF
	X3QlVddO9HKuTD
X-Received: by 2002:a05:622a:14cb:b0:501:40b2:453d with SMTP id d75a77b69052e-505d296ba35mr134758821cf.23.1770048572253;
        Mon, 02 Feb 2026 08:09:32 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::7a0a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50337bbb66dsm107921011cf.29.2026.02.02.08.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 08:09:31 -0800 (PST)
Date: Mon, 2 Feb 2026 11:09:28 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Liam Mitchell <mitchell.liam@gmail.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: usbhid: Intermittent EPROTO errors trigger USB reset and
 interrupt user input
Message-ID: <43c9b46c-344a-434e-8581-c6374a6e8430@rowland.harvard.edu>
References: <CAOQ1CL6Q+4GNy=kgisLzs0UBXFT3b02PG8t-0rPuW-Wf6NhQ6g@mail.gmail.com>
 <1ebf9d19-7293-4902-857b-164fd4d21f25@rowland.harvard.edu>
 <1c317994-2932-4e2e-8e80-1c90606e63c9@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c317994-2932-4e2e-8e80-1c90606e63c9@suse.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33010-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rowland.harvard.edu:mid,rowland.harvard.edu:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1A791CEB67
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 04:48:49PM +0100, Oliver Neukum wrote:
> 
> 
> On 01.02.26 21:40, Alan Stern wrote:
> > On Sun, Feb 01, 2026 at 06:57:06PM +0100, Liam Mitchell wrote:
> > > Hi,
> > > 
> > > I'm trying to understand and fix intermittent keyboard/trackpad issues
> > > on my 2013 MacBook Pro running Linux v6.18.4:
> > > - missed/repeated/sticky keys while typing (this thread)
> 
> Alan,
> 
> this raises a question. What happens to KEY_UP events generated in
> between the last EPROTO and the reset? It seems to me like we need
> to assume that a reset implies that all keys have been released.

That question is specialized to keyboards.  You could ask a similar 
question about mouse buttons, or other input (or output!) devices.

But it's a good point.  There should be some sort of callback to inform 
HID drivers that their device has been reset, so they could reset 
whatever internal state they are maintaining.

This sounds like something going way beyond usbhid, though.  And it 
probably would not crop up very often, so it wouldn't get much testing.  
Liam's computer seems to be pretty unusual.

Alan Stern


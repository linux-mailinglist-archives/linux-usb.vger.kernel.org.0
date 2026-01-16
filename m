Return-Path: <linux-usb+bounces-32444-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4BFD38ADE
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 01:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A350E304A7E4
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 00:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D223BBF0;
	Sat, 17 Jan 2026 00:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxBlzFEd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF841E4BE
	for <linux-usb@vger.kernel.org>; Sat, 17 Jan 2026 00:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768610950; cv=none; b=F3NHmdpY9W0vodhg4qmtjsBwSjW/TB73hcofy9QRjsRPNT4E6Lv9VyXkFtQdYafmFnAk++1bWSw+ffKA7BaybwtZkxLSRW1Va1EN42Im4VyU1JC/gUAnjRNa4lwcNvLpW36dhOjzB4UMyyx9FHq687GD7l5GvcErLyAx7YeUqGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768610950; c=relaxed/simple;
	bh=ftXEYn+NQ1SnIwHJGtXDc7X4HarWN6Q5+so4Xq8sTA8=;
	h=Date:From:To:Cc:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oCaT2ps7mvhNVPdcPKqJjfghtUEH4sfAcFcCgJTTKrknjFHOnZH/0LTFg+ySysHKCOsfZ8fyvKKIz4uwD6ncrfYREoPajPCX4eSyM1GhzV06LUCxlYgZrE/gMYpkMp8NBnNgzKzMv2Rf5uP+YVNGN/I7ZHN3NxMCrViIBOZkqSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxBlzFEd; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-383122fbc9bso20785941fa.1
        for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 16:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768610947; x=1769215747; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Okf3U9QDNGb4UYL7N7Vkacook/dnzzX77oUe7PD87XI=;
        b=cxBlzFEdIquz5OZ+1anxxKB2sRdoEyZFX5nYNLLg5S649dri/Bx6iCL/gSdX0tGtlY
         hYKOpjXHatMESQHMyYURy3rm2R/TqiU5DpTJo34SFHJYziC85/1tuT6qXnHsofXJX7Mx
         1FvwiGx6z/6+qjVvbEpM6kauPNDaOyhL58AfVKVd//fOs7+rHcSHrmMTtt3StMRTV/Zv
         2eBWw7AxblhBBI2fandgUgcWtkcy27i72+lIGrIAFHS1C8IL6vrS5H0WuxPpq/L7W6GE
         h5h95vyPIuAMKIzHCHFyKqZIXquC7htdTggPqOBOqek+gVrhdMJGH3/hG0jHtufaA6Ge
         ixzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768610947; x=1769215747;
        h=content-disposition:mime-version:message-id:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Okf3U9QDNGb4UYL7N7Vkacook/dnzzX77oUe7PD87XI=;
        b=Kvtl9WdoGgKA16+U9FCodKVTMLhRpU7WdGlyU2qVt3SUj0rBD+4pRFf4kOexfq3VlP
         wJQCulQotneNxWDrmYZMjHMsZM9cDqaN4jUODgFK0W2Bv9a8kVBNkvrf/H3OcS+xgHrT
         gi7yUQXAH4lO97PDTyf0Lcg7AoBMlyc64HOV2GPuMNd7LA5cB/2TrraLzavv8rOnzbU6
         KcLzubdy0WlMaBHEhp91QeoDcefVcEF8SUwypj6PgjzE3uw4fUmKr3j1eQC7H4vLp1bn
         vrsrPfaJ3d+aj5P9pybVdYjotIxqcv7irDWTPjTLJz87b07iGJMwu2BsRMgiDv7/zbjN
         cneQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh9NMkKjFvZ/c5o9Q+1hHN3i7u5aM+4IZaHFw57UcTDkR+4aOMsI6t/fQmKsVYvS6FiD0NwMgOzDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwveOqPkh1nlpP9LKosG7BhjYYABQzTTVW3cuPGtfY3Ylbeopez
	AsqVNNPJLIe+G5X2Poq2SRwbxHtQonnv2cBiqW79ZWwoSqilp+cz3B7ml8Ibg+h0
X-Gm-Gg: AY/fxX5btwwTI3Gr3ZnEKHVa/ZvX7Ic5XEjAhCPEYxw5zaKI5gbXEBgQ4BHbYVPMFSv
	LXZQVT6lCZSMapL5vpJlNsFcad6myammxoLSYFxL9rqYrFIOb0wfJ227c6f4Enf9JjwzjJTRgfH
	e6bW4UGBtmF6K94ReBsEIMfVrwltLbWMyESF8TW7bl1kQ9+49QoPDq0AxpSqixr0mUOfStiS2U6
	pMIdSisNMoGnsnJfSKDQ4jm4IXijTYQbmwUjBscaet/c1xniIcmobYCWOK12oeGCWPzo2lwe3Ng
	SJiSRXS+yPd6gtBAKuQjoJzo9r+TSHX0UKgyUlYC9AMVHfoAMRpmxhEeSDs/L2A1EA/9YlLGMej
	fgEJLIPKL8fJnd5/z6sw9kBbkMfMmRGaZbmHrhuPgYsvl7bZ5xHIPzteH3vdD8HYnWPSoxYcpDq
	IIdsxixuR+2hADMFx6I1OjEMKh17b9MqGGOdy29bfZa+jj
X-Received: by 2002:a05:6000:1a87:b0:431:c73:48a8 with SMTP id ffacd0b85a97d-43569bc4a06mr6593543f8f.29.1768604753879;
        Fri, 16 Jan 2026 15:05:53 -0800 (PST)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569926648sm8083339f8f.10.2026.01.16.15.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 15:05:52 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 531A5BE2EE7; Sat, 17 Jan 2026 00:05:51 +0100 (CET)
Date: Sat, 17 Jan 2026 00:05:51 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: xiaopeitux@foxmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Pei Xiao <xiaopei01@kylinos.cn>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, pdormeau@free.fr
Message-ID: <aWrET0wfgHNGd2cT@eldamar.lan>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Bcc: 
Subject: Re: [RFC] usb: typec: ucsi: Fix array index out-of-bounds in altmode
 registration
Reply-To: 
In-Reply-To: <2026011617-phantom-diploma-cd79@gregkh>

Hi Greg, hi Heikki

On Fri, Jan 16, 2026 at 12:22:42PM +0100, Greg KH wrote:
> On Thu, Jan 15, 2026 at 11:32:01AM +0800, xiaopeitux@foxmail.com wrote:
> > From: Pei Xiao <xiaopei01@kylinos.cn>
> > 
> > Add boundary check to prevent array index out-of-bounds when PPM returns
> > more alternate modes than expected.
> > 
> > log:
> > UBSAN: array-index-out-of-bounds in /build/reproducible-path/linux-6.17.13/drivers/usb/typec/ucsi/ucsi.c:609:18
> > index 2 is out of range for type 'ucsi_altmode [2]'
> > CPU: 10 UID: 0 PID: 275 Comm: kworker/10:1 Not tainted 6.17.13+deb14-amd64 #1 PREEMPT(lazy)  Debian 6.17.13-1
> > Hardware name: LENOVO 83J3/LNVNB161216, BIOS PYCN30WW 11/17/2025
> > Workqueue: events_long ucsi_init_work [typec_ucsi]
> > Call Trace:
> > <TASK>
> > dump_stack_lvl+0x5d/0x80
> > ubsan_epilogue+0x5/0x2b
> > __ubsan_handle_out_of_bounds.cold+0x54/0x59
> > ucsi_register_altmodes+0x233/0x250 [typec_ucsi]
> > ucsi_check_altmodes+0x1b/0xa0 [typec_ucsi]
> > ucsi_init_work+0x919/0x9b0 [typec_ucsi]
> > process_one_work+0x192/0x350
> > worker_thread+0x25a/0x3a0
> > 
> > Reported-by: Salvatore Bonaccorso <carnil@debian.org>
> > Closes: https://lore.kernel.org/lkml/176840984804.2144647.10736984532804520381@eldamar.lan
> > Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> > ---
> >  drivers/usb/typec/ucsi/ucsi.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > index a7b388dc7fa0..00575a8720cc 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -599,6 +599,8 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
> >  		 * incremented.
> >  		 */
> >  		num = len / sizeof(alt[0]);
> > +		if (num > ARRAY_SIZE(alt))
> > +			num = ARRAY_SIZE(alt);
> 
> As Heikki said, this is a broken hardware device, please fix that
> instead as it will not work with any other operating system either :)

Thanks a lot for looking into it. Pascal, can you pleas report this
issue then to the vendor as it is a firmware bug?

Regards,
Salvatore


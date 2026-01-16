Return-Path: <linux-usb+bounces-32446-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBB0D38B03
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 02:07:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A50423046577
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 01:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341F71A3179;
	Sat, 17 Jan 2026 01:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="az0+MHP8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9224197A7D
	for <linux-usb@vger.kernel.org>; Sat, 17 Jan 2026 01:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768612017; cv=none; b=RO9qsDH7m5IzWsvUb7r5uFB2cbhN0Apx8gtZW7GGoFddHKVwmgApNBHwnTxnVPAzsMKxOqPgTOxzQn8nSwRnRjzw/UGHfVREJofKC2cogps0usp0T5jBe/nOgUBKEGUgbSQ7B+qDoLRekImrk+BBYJBloTb8isq9sfwV7u+l9x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768612017; c=relaxed/simple;
	bh=7oHpyfvFo5aHQC3q9HZzJ646QxSFdCaU7tSFV/IZzWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0l558m7NOkcpLFRfOZL9x8HIGRi9g2I4LVacccpJVd8oiPHWzZq4reyr/n0Yrj2LWVerbBYcYbC3rUfV2zFsPEi4qq/S2vH10byblcQcridDLvVK2OqcRoCye+h0/YnoEf28cCfSsu39I/sWNg7sR06b29yya9ZFeB1CfCbsjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=az0+MHP8; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8010b8f078so427579266b.0
        for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 17:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768612014; x=1769216814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21AXstw+KtwXhMbOLubkuYuqjDGhA81uz7GZPXnRfTI=;
        b=az0+MHP8i+owByCjyFV6ADd6ZNbShmFZSzPCrQ+aWtiwrusgKO4VyhTg711Zha60Kd
         m0Od4faMtPj/ZooMWHvSIzZSybhjvGmeUqjLeetzfYBebD9BptAGMxE8hznnq/R7PPOS
         EINvJ+U6vxNhoUR+2H4tUhyKg3MxZg2SrqXOg6mG0vr12tFvaEppEo4QTOX+cV1PWQ8G
         qV9pmdJwr1aSWIFYNZ9bipue7r3P1dUQNW4fxOFOAB7PHZukrzDMPLQU5cjL9xR673SS
         xGvmiQ1p9Xyfd5dKlAFhG/+g3aamDnWGniIjwOz3UvjkTtz8wJQ9T3laojTaI/kGLx/+
         UwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768612014; x=1769216814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=21AXstw+KtwXhMbOLubkuYuqjDGhA81uz7GZPXnRfTI=;
        b=bZ1n/zqEDc/JQKOG83Ebi9GnBJHti3jA2TZo/Ba9QDd88G9iBcRRgRSwJc6t12K8O7
         FyBQeZLejOkcAT5wCgQbkIsyN/MbphO0KjrfYjwtpgrscafQsq4O2FOQaXccK7qwxDHi
         8cAv7kvscf1eK9TVqcX8kKHTXprfjY7rwnMpvh3sLDKoPZiAn+l3YuStRd4GBDGxilDi
         d3FeMzlrEkWunKPb/ldBCmeBScAFNByAV/dTuCDIKrlqmskTHCAH3vdExV9z3fCQK7WG
         F96UyFbMm2bAX0ngfBt2+RkjGcaOpG2Juj9sQeqh2DRTOolJ1EPeIBz8poka2NCwTPVu
         mnww==
X-Forwarded-Encrypted: i=1; AJvYcCU71OLJaSG+qGXAxulzfj7BpkCh3PP1aKJWlXWCDJyHI8+WbS9JKuhuZyb3BSZ/8c6+AHbNxVOqYVM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws1lJNPsRxKcgyZsjw3u8RUy9+bYmuAh8pNWeeCAqcMSZbcQz1
	/JAXYBlBcXfxg58H/htB5q1Q1A7YRF0HbN1KHQpNuIXFugrx6Z3UIdBboOIBUqmG
X-Gm-Gg: AY/fxX5v+SBjque667AMJZwAXLKZ8w06lx62Jknk+v68cjFlT9vYo1ej9tt+VpF2zpp
	QiG/dGeu6JNjHikn4CyFM5VoBPDmHETYS0JwwcVWa84Lc8JjrfCr/mJ6hZTDJOU8dGQvtqyvUiQ
	8SAeuEFT7krLc54+z8ESm6thNAz+v/TTAPZ7ykv094ruxdw8k+gebcAlSW5+2lqRrXNuNtsHB8z
	kgkJ0T1DpIFYOVGfnzR90q3oZakpZIw7RChA4f7cvDrJzWmkkiLa6QLK+WZi0meuAqANEDHGBLA
	1JUDpTOtugEVdMfiUEhszoljVHNEI0IQyWACEs62PHcFPZzlLQuURDVd6yZiY4ZyFd7J9IrOiZU
	7bb/5aE3P2aRZjMLor4cUT9WQMtNVh9uDcGG6trwGIHHnHS5vtjlaZjPIFpgnVR1hxQYOVeLjyt
	G5Gdis5s/Lr8gcorVVt6+Jyn3o0pDCp9zE/etsuxCksK34Tit2gW3ZLJU=
X-Received: by 2002:a05:6000:200d:b0:430:fafd:f1d2 with SMTP id ffacd0b85a97d-4356a0248fcmr5796166f8f.11.1768604885113;
        Fri, 16 Jan 2026 15:08:05 -0800 (PST)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569927007sm7590454f8f.16.2026.01.16.15.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 15:08:04 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 910D4BE2EE7; Sat, 17 Jan 2026 00:08:03 +0100 (CET)
Date: Sat, 17 Jan 2026 00:08:03 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: xiaopeitux@foxmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Pei Xiao <xiaopei01@kylinos.cn>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, pdormeau@free.fr
Subject: Re: [RFC] usb: typec: ucsi: Fix array index out-of-bounds in altmode
 registration
Message-ID: <aWrE0_kNkneBsgdO@eldamar.lan>
References: <176840984804.2144647.10736984532804520381@eldamar.lan>
 <tencent_A6F79CBEAB47840EB720951FA48D97CD4906@qq.com>
 <2026011617-phantom-diploma-cd79@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026011617-phantom-diploma-cd79@gregkh>

Hi Greg, hi Heikki

[sorry for getting this twice, my former email was broken]

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


Return-Path: <linux-usb+bounces-31366-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58639CB2B2D
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 11:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E246318E779
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 10:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021973161B3;
	Wed, 10 Dec 2025 10:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhDcGuxJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAE6316190
	for <linux-usb@vger.kernel.org>; Wed, 10 Dec 2025 10:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765361928; cv=none; b=UKSxigfhLQFT0aP6rx1i2bWh3mH815lTlfwa2+l2Hm2RLIIXb8xiL+VgGGBPUdmAaEBhd0uNJ+OyT9mEmwKXu3owUPj7Y79hAYIqPLroTbs7hOnAUqXlL/aUkns/kOmm34qwArEdj48sA2CJ1xgRAv7W2LB0GSuUD8Q2DL0qEwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765361928; c=relaxed/simple;
	bh=I/JMNNp1r55UL6QKtwkNR+AyEKT986MddtqR5zGlc94=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iR1lFdgnsN3jQcydjaLuOjQJMcylDwN2rbEcw8yFU8dnZJ7HqzA2539iSngHWcAWc3JEun4T64Un0Pw/6yNzxX/Mj+niNYzzKt8qq9flD12TAyLL2XA+bGQ7o4j2e8JI8Lp3Fylic4Gdw1a8znDouuCScH3zO3/v2meE4kpye24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhDcGuxJ; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-42e2e52cc04so2392159f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Dec 2025 02:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765361925; x=1765966725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivJBwP5GNe4rsrKX30pWrsmTA+5ClhNGxoBEPh+DS3E=;
        b=JhDcGuxJoSfUxR7CjDBVcePFgl7mIlIgVNM+ZlYC0d/guoykVKnfcRUyM/pynYzusZ
         TxL5tihTds4nAFseG7GA/fpk+4wyFQGb5LVl9VhE8zmpRkPXyPb1enDa6+VpVs8y47UO
         qRmbv4xnMfyBkJseULJm3hWsqbAaSfNuA7SIup3Ii//TW/fZAISQuCZoBduMHO1u7E1x
         3Q/IHLu3w02yJL/ny11hvpkI+IylQIqCs3cF7ixmWQNYfoPXrAG+aVoRX0ghjIrrO2Gg
         Ieo5xVrRZYhfBl1RNIo/qiLaJCt6XV5pAdLXH7eNl/ZHLa5OCHTmBYRjLJxxUFKzgfSk
         KotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765361925; x=1765966725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ivJBwP5GNe4rsrKX30pWrsmTA+5ClhNGxoBEPh+DS3E=;
        b=jC4s6QsH+7xZFCgPlGjX/THHuJcOC+y3gCPXDGmhIl35990xayWLTOZj+WLGUnfzIo
         ibXl3QaFS7IkvI6PszD9yseXTh8jdINDL/l23HR/EzZQt6BnHV2vpkSaPn71kFc5CKTu
         Q1zOjQXiN3kUrOoNZhT/sdn1c4cB6jejliSEEC3NAbhqVMzX1R0wrYiKmXq8EY3e/SDL
         yr+BCIT6UcQdqS6Bvv2QfJoHg8kiNCPfmGivoIkLpfI19UOz8clYC17hevA0G4voJLmP
         hEzmZUoCuF94fdR+w8Z1wgCAjOoMOsHMFI6EdEgeMwK9ykWAooUoUUrAKxpse6nFypNr
         twhw==
X-Forwarded-Encrypted: i=1; AJvYcCXg19A8iTOa1Dgb7YbXBGv6kYsKIwSoQ9S9iJW4ADARBYkzfZdpZhg9/5SJvcxfjdTMenIgKo7G6GA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwviA6wS3GFsJ86cFapE1TQLjGkDUItcDBfmHlFdGWWRl3xvFm4
	UrZVdrHJGIYCWpo8tXG5Js6pQNxdsrATkUeAxD2o4STGxhRjRZ3gXtrt
X-Gm-Gg: AY/fxX6YQuIP83LpBa5u8F6tVJc6aegeXa0ip4r2t8/Gqe6IU1Fzk5c4B5HA07Ccopo
	vtXdUB3EYInZH/VcshE/tDSEUsqQXAFyX2vPZIlqDdlW0mkBwocIJO14ts8Apt5wVhIopCXymJ9
	0eep/7lEzZamaDXWGUDLYjIOdgFF7zpe3TY3KVAKygQ+HlvUjJfoCffEcFezOzJzQ4iGBBrB/y6
	zWa/cQ/uuzvwr1ulD45GzL0lPkYDRH+2qYn43CLbz6q/DkzPNShqUTBFjfzwrj4WccivncxWELg
	C+WoJlG9YyahSCOVAUt+Uxqb2Z6uqshSpy4tezbB/RcBfCUfVaCt8RbhrB8qJAB4gM5WQK1OB6H
	PGuUIXsH0suSZVcz8nWtTKVWis63bQ/x7IVlXr3bn6qTwO7cDrv+Ty8kLVxoGnrUWcLJ4okyn94
	Sfeo2l7zNBjnx+P6S29eSraDeoJ8ClLKs8LmLkJEfv/q4ab8mnGA6/
X-Google-Smtp-Source: AGHT+IHnnDz/LzTTRTNEb7lg6Qv9pz02shzN5UFCICKksM96FcH+4Cq+vdcgE23tcA9uj4y82edHXw==
X-Received: by 2002:a05:6000:40c8:b0:42b:3bc4:16dc with SMTP id ffacd0b85a97d-42fa39d2c8emr1581708f8f.21.1765361924693;
        Wed, 10 Dec 2025 02:18:44 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfeadesm36502473f8f.10.2025.12.10.02.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 02:18:44 -0800 (PST)
Date: Wed, 10 Dec 2025 10:18:42 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Crt Mori <cmo@melexis.com>, Richard Genoud
 <richard.genoud@bootlin.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Luo Jie <quic_luoj@quicinc.com>, Peter
 Zijlstra <peterz@infradead.org>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Simon
 Horman <simon.horman@netronome.com>, Andreas Noever
 <andreas.noever@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH 2/9] thunderblot: Don't pass a bitfield to FIELD_GET
Message-ID: <20251210101842.022d1a99@pumpkin>
In-Reply-To: <20251210094102.GF2275908@black.igk.intel.com>
References: <20251209100313.2867-1-david.laight.linux@gmail.com>
	<20251209100313.2867-3-david.laight.linux@gmail.com>
	<20251210055617.GD2275908@black.igk.intel.com>
	<20251210093403.5b0f440e@pumpkin>
	<20251210094102.GF2275908@black.igk.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 Dec 2025 10:41:02 +0100
Mika Westerberg <mika.westerberg@linux.intel.com> wrote:

> On Wed, Dec 10, 2025 at 09:34:03AM +0000, David Laight wrote:
> > On Wed, 10 Dec 2025 06:56:17 +0100
> > Mika Westerberg <mika.westerberg@linux.intel.com> wrote:
> >   
> > > $subject has typo: thunderblot -> thunderbolt ;-)
> > > 
> > > On Tue, Dec 09, 2025 at 10:03:06AM +0000, david.laight.linux@gmail.com wrote:  
> > > > From: David Laight <david.laight.linux@gmail.com>
> > > > 
> > > > FIELD_GET needs to use __auto_type to get the value of the 'reg'
> > > > parameter, this can't be used with bifields.
> > > > 
> > > > FIELD_GET also want to verify the size of 'reg' so can't add zero
> > > > to force the type to int.
> > > > 
> > > > So add a zero here.
> > > > 
> > > > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> > > > ---
> > > >  drivers/thunderbolt/tb.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> > > > index e96474f17067..7ca2b5a0f01e 100644
> > > > --- a/drivers/thunderbolt/tb.h
> > > > +++ b/drivers/thunderbolt/tb.h
> > > > @@ -1307,7 +1307,7 @@ static inline struct tb_retimer *tb_to_retimer(struct device *dev)
> > > >   */
> > > >  static inline unsigned int usb4_switch_version(const struct tb_switch *sw)
> > > >  {
> > > > -	return FIELD_GET(USB4_VERSION_MAJOR_MASK, sw->config.thunderbolt_version);
> > > > +	return FIELD_GET(USB4_VERSION_MAJOR_MASK, sw->config.thunderbolt_version + 0);    
> > > 
> > > Can't this use a cast instead? If not then can you also add a comment here
> > > because next someone will send a patch "fixing" the unnecessary addition.  
> > 
> > A cast can do other (possibly incorrect) conversions, adding zero is never going
> > to so any 'damage' - even if it looks a bit odd.
> > 
> > Actually, I suspect the best thing here is to delete USB4_VERSION_MAJOR_MASK and
> > just do:
> > 	/* The major version is in the top 3 bits */
> > 	return sw->config.thunderbolt_version > 5;  
> 
> You mean 
> 
> 	return sw->config.thunderbolt_version >> 5;
> 
> ?
> 
> Yes that works but I prefer then:
> 
> 	return sw->config.thunderbolt_version >> USB4_VERSION_MAJOR_SHIFT;

I've put that in for the next version (without the comment line).

	David

> 
> > 
> > The only other uses of thunderbolt_version are debug prints (in decimal).
> > 
> > 	David
> >   
> > >   
> > > >  }
> > > >  
> > > >  /**
> > > > -- 
> > > > 2.39.5    
> 



Return-Path: <linux-usb+bounces-10971-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D038FE335
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2024 11:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6F101F2184F
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2024 09:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CCA11552F9;
	Thu,  6 Jun 2024 09:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E5FN9IWj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FE71527A0
	for <linux-usb@vger.kernel.org>; Thu,  6 Jun 2024 09:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717666946; cv=none; b=Lw08BdicnEYV8PPJaP3mMpZUopbeOAgN3OWSjiQIB395tZJI56xeY3eRexRagnZhfVfaMwB/E3vseOExmb9MMvspROAaJnVh6qmssjt10gYuRJ4Bti7fwSMemB5LRgwJ1691OXxkgeYi38zf/bhUFbIwZsinbGRBMvOByFlAsVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717666946; c=relaxed/simple;
	bh=Z+b7d3fhc4m4+HH35+El67g/rcBghxOw/7N/brUEw2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q8WuIz1lmExTBQFpJc70+6eIRYGKdH8fiLut1Xvk3+MiTvgTx1Sj2ERSptucEfekmYQHdt++qhUeFF3xLe1sMKzUsNEJ24mUiX6obix1rBx4XbUrDpQ4vYfhknwM4QY2ZAwrNPrTFDk0oRVwp+Y6JrtHKQJ/LyZXTxlL3jW61Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E5FN9IWj; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7025b84c0daso613817b3a.2
        for <linux-usb@vger.kernel.org>; Thu, 06 Jun 2024 02:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717666944; x=1718271744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZxkAQ+JG8hv+VfYtFPLswW4j/3rOvFhx5X0N2PU448=;
        b=E5FN9IWjmGxVoUD+OWTZamrPnXDvPSavkFVxYovj1GvPqpojMxxGK7EXOEVwM89/sj
         BA67SJlwRC+KnFKCrGDfFXM7jHjo195s9ppGv0U/UVHyDfTEkid9rldQDO70NAQhQ33B
         TUKIkU1Oy4v16ytVgyRDllutuHAIkahfrmzcuFWvPWzrGUtjeD52YtvBdmG0usvAFtog
         5agnUSEhElOqDGCmKSbzHOLAwBWkyI1OwIFrNiTvuqtw3aIfyaPhl3zvgyBN6e6H9cYv
         g7uAXYDRDtM7vr0mO/rUBZET4HlpzVE5cDs+hU2LRGGDQN6uXa3F/Vpd31FOyyXgWYpP
         E3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717666944; x=1718271744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZxkAQ+JG8hv+VfYtFPLswW4j/3rOvFhx5X0N2PU448=;
        b=LzYHmrmry9UQhMzaKVJ/vF6sPXkZLucN9bAruj3eTkJ1IOGsnmIhFCVzFLbPzoAhbd
         /GZ7ITI9sBUfct4dhKIhHtvqfisd0agP3CIIgdykYtpK7yTfhFPPQT7B5Twf79ySBFKl
         3gxv0yK8ShTyZTuiEPapfCh8wPooiGeNw3AfdOXC/4mGiQGonIAPX+qGWb7QXXPeyx5T
         y4mwQu9nHgsLwcbF8xjCzIXnDGlqgwkDS/Ony9MAuPDtCeomsD7g/EwcsR+U5BS5Y7t0
         qAitjgvdkCyW6rL4NkXBV2LWsGHmAZId1ChfR2ZEGvRWLhaQR8CSNWRNBz3ZPRkQ/IXm
         9aAA==
X-Forwarded-Encrypted: i=1; AJvYcCURcQ2bxH6yTMoSI6/BxoB4IRJb9krNIOMwQvlaOYV3QoCpkSEtGoR6RCpDuTm62l1SzTrslCul7NoLYHKZhI74IEXuNGGhpYH2
X-Gm-Message-State: AOJu0Yz9ZkjZBQgITxwrIknw7wZERL71fbIxnXT/wqdGdcd2MoEXvl/r
	AJSwO43HlaJm99JN+AoVE9huOcwi6xAov45RL06tV3iXifyzHaDLA1vxdFk9XUsctChJ/uAuFqe
	bq38tjagxn3hHY8iNAJnhNTfpohmwOcbTV/TO
X-Google-Smtp-Source: AGHT+IEWwVSwT6aqEkrDe0tLMBSTWElwotQtqstSRStzjfIU8jhDcLm33ZWeSi7tWYVCsMsV4ghgN5gJvMEjynSIzaM=
X-Received: by 2002:a05:6a20:daa4:b0:1a7:aabc:24ae with SMTP id
 adf61e73a8af0-1b2b6ed7966mr5928466637.18.1717666944034; Thu, 06 Jun 2024
 02:42:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com> <20240605175953.2613260-8-joychakr@google.com>
 <f98a1d8f-e936-4798-8447-c642e8fe11d5@moroto.mountain>
In-Reply-To: <f98a1d8f-e936-4798-8447-c642e8fe11d5@moroto.mountain>
From: Joy Chakraborty <joychakr@google.com>
Date: Thu, 6 Jun 2024 15:12:03 +0530
Message-ID: <CAOSNQF0Qj2CnRDWAGM8Y1wyEdgWP04RDJx1TKO-Ge4nUH=qxoQ@mail.gmail.com>
Subject: Re: [PATCH v1 07/17] misc: eeprom: at25: Change nvmem reg_read/write
 return type
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, manugautam@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 2:11=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> On Wed, Jun 05, 2024 at 05:59:51PM +0000, Joy Chakraborty wrote:
> > @@ -195,10 +195,11 @@ static struct attribute *sernum_attrs[] =3D {
> >  };
> >  ATTRIBUTE_GROUPS(sernum);
> >
> > -static int at25_ee_write(void *priv, unsigned int off, void *val, size=
_t count)
> > +static ssize_t at25_ee_write(void *priv, unsigned int off, void *val, =
size_t count)
> >  {
> >       struct at25_data *at25 =3D priv;
> >       size_t maxsz =3D spi_max_transfer_size(at25->spi);
> > +     size_t bytes_written =3D count;
> >       const char *buf =3D val;
> >       int                     status =3D 0;
> >       unsigned                buf_size;
> > @@ -313,7 +314,7 @@ static int at25_ee_write(void *priv, unsigned int o=
ff, void *val, size_t count)
> >       mutex_unlock(&at25->lock);
> >
> >       kfree(bounce);
> > -     return status;
> > +     return status < 0 ? status : bytes_written;
> >  }
>
> So the original bug was that rmem_read() is returning positive values
> on success instead of zero[1].  That started a discussion about partial
> reads which resulted in changing the API to support partial reads[2].
> That patchset broke the build.  This patchset is trying to fix the
> build breakage.
>
> [1] https://lore.kernel.org/all/20240206042408.224138-1-joychakr@google.c=
om/
> [2] https://lore.kernel.org/all/20240510082929.3792559-2-joychakr@google.=
com/
>
> The bug in rmem_read() is still not fixed.  That needs to be fixed as
> a stand alone patch.  We can discuss re-writing the API separately.
>

True, fixing the return type would fix that as well is what I thought
but maybe yes we need to fix that separately as well.

> These functions are used internally and exported to the user through
> sysfs via bin_attr_nvmem_read/write().  For internal users partial reads
> should be treated as failure.  What are we supposed to do with a partial
> read?  I don't think anyone has asked for partial reads to be supported
> from sysfs either except Greg was wondering about it while reading the
> code.
>
> Currently, a lot of drivers return -EINVAL for partial read/writes but
> some return success.  It is a bit messy.  But this patchset doesn't
> really improve anything.  In at24_read() we check if it's going to be a
> partial read and return -EINVAL.  Below we report a partial read as a
> full read.  It's just a more complicated way of doing exactly what we
> were doing before.

Currently what drivers return is up to their interpretation of int
return type, there are a few drivers which also return the number of
bytes written/read already like
drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c .
The objective of the patch was to handle partial reads and errors at
the nvmem core and instead of leaving it up to each nvmem provider by
providing a better return value to nvmem providers.

Regarding drivers/misc/eeprom/at25.c which you pointed below, that is
a problem in my code change. I missed that count was modified later on
and should initialize bytes_written to the new value of count, will
fix that when I come up with the new patch.

I agree that it does not improve anything for a lot of nvmem providers
for example the ones which call into other reg_map_read/write apis
which do not return the number of bytes read/written but it does help
us do better error handling at the nvmem core layer for nvmem
providers who can return the valid number of bytes read/written.

Please let me know if you have any other suggestions on how to handle
this better.

Thanks
Joy

>
> drivers/misc/eeprom/at25.c
>    198  static int at25_ee_write(void *priv, unsigned int off, void *val,=
 size_t count)
>    199  {
>    200          struct at25_data *at25 =3D priv;
>    201          size_t maxsz =3D spi_max_transfer_size(at25->spi);
> New:            size_t bytes_written =3D count;
>                        ^^^^^^^^^^^^^^^^^^^^^
> This is not the number of bytes written.
>
>    202          const char *buf =3D val;
>    203          int                     status =3D 0;
>    204          unsigned                buf_size;
>    205          u8                      *bounce;
>    206
>    207          if (unlikely(off >=3D at25->chip.byte_len))
>    208                  return -EFBIG;
>    209          if ((off + count) > at25->chip.byte_len)
>    210                  count =3D at25->chip.byte_len - off;
>                         ^^^^^
> This is.
>
>    211          if (unlikely(!count))
>    212                  return -EINVAL;
>    213
>    214          /* Temp buffer starts with command and address */
>    215          buf_size =3D at25->chip.page_size;
>    216          if (buf_size > io_limit)
>    217                  buf_size =3D io_limit;
>    218          bounce =3D kmalloc(buf_size + at25->addrlen + 1, GFP_KERN=
EL);
>    219          if (!bounce)
>    220                  return -ENOMEM;
>    221
>
> regards,
> dan carpenter


Return-Path: <linux-usb+bounces-33740-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AH3JHd1GoGkuhwQAu9opvQ
	(envelope-from <linux-usb+bounces-33740-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 14:13:01 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD51A1A62A7
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 14:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E111303466B
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 13:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A6330DD12;
	Thu, 26 Feb 2026 13:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HjhiWugn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1B830BB85
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 13:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772111242; cv=pass; b=r4r6c4vmUoLmesG7uNVl6cYR3qtJyp4woNozQuqZ49bC6xk0nyQSAbFlsYpi4j71OQk53L1uKcdP/a020t08oDmJ+RIlV3ll+eWfVhnN/lDzQwoxbdneOu2qKSDq8db3CIzJ82964kt0IbZCbC0kNvt8Qep1QBBq8PhzJgmrax4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772111242; c=relaxed/simple;
	bh=PH93HpdkdJofvFky3XqSMfx5gYWyWRM1i05odCyD6IE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=peEr+fxoPd/Z6Oqy+hf+l9TY/36GpP1kBK9MlDtzFO3Khgp1IOkHvlhgwsNA+c6lRx+jRWMJsjqltxoyAM10Nzd2OMprOqcepvpa1tJARcF3oq3FNs6b/LaVLrvmflM+lGOiOOi5424OfNyno9/iHZ2g0n9YiwfUhT/F/vFo8Q4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HjhiWugn; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso9444215e9.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 05:07:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772111240; cv=none;
        d=google.com; s=arc-20240605;
        b=G671YaT5/pMwurocGBy+HcXpz7bb97tnRMSnMGm+H7Gs1wvqvTguoC6gULBkXR0Hhy
         geawj9nT3tNRgOw3AYlV5oy4vE3hKTdxwGyzr+qdhBUl7ycqwv6FYpBOdrc2r5pnTzux
         q5QCGtBW4luyIkLBr7UizdFYg6VilXl+67dPCKmj9q29adszHcqRaEH8Ju/VBR6jEbHp
         i1o8h09ZtM/OOWsrUeTfFV6hOfI5tc/NJuzblc7AiosHHwPzAvYFmzjUBHReVEVBoRrx
         /Zc1i5cM9qnkrRuXF8JwZe1tJdN6qy/xL8JJA+h41/ohxQAqqkS3cRiHLsM25/Fv2A0/
         uK5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fRDBqXHIkrqimJOneCwWxD6R3UUQnL48+kxjA/N6QM0=;
        fh=rcDG1pbgSE60TGSn/uHBQXTRBXIaAti3ebicKr+Sf9o=;
        b=jyomBLGDtPldjJKPMLjQPMsB63VHQB4apovjeTksgHM+wdciqxtXc7qdJx5Daci8/f
         e0N93Xf8+g+YaZo5NTEEHYPtn1d/xM4o7OjItH9pAY92QLaCYhLk2p43KyCNoC+N+MNy
         Mpg2kBz69Tlayu07hHAhIAX5o8Gl2eeMiH8R0noQ8HFhCszuQxg33GGoKCSMH4S7KpME
         3IJ63wo042OGQRaCleJ9T0h0zdbfvmmZA5F7shR1gxRhXARCipa1rNS2FXosIMNrkjb0
         9CnczgojFYEc+AUAhPZ0T0j4jX+Mlsp4X9Zk6bnWDfqOhCgKebHibm+KSNywz12DC/1d
         IGKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772111240; x=1772716040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRDBqXHIkrqimJOneCwWxD6R3UUQnL48+kxjA/N6QM0=;
        b=HjhiWugnLinxWCW4LlIedyzt/ELcMDUy824JOE5z9UjleOrQfFg6SfbEfrQBdIEwtg
         H8rp7Bj6arlf3CJKfZysq04WkJBnZFWpu2DDszxByAot4FrR33G1ttMvt144Hf/MiARX
         Gh0PauH6dot/Ia9okxgnosvlwyDKR+vgPKcz1DFC0Lw5Gcp/Rw4by2wJGSKijc7wi9iD
         yz6K05nJa+yctsJzay6t5+Z35y5jEhOFOBt9A/eRdhFa5wEcXd3PrXEDTH1FO9wYU3tJ
         +TkHfRHg4//sxYXjDwmJVzJlHxHd73AjzNtvUgo/LC9YUL0IzTq7mA5dwZqJR+aISq/t
         phqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772111240; x=1772716040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fRDBqXHIkrqimJOneCwWxD6R3UUQnL48+kxjA/N6QM0=;
        b=AbqnwZDLES+FAfAFoJIaMLu0ZZJ/vzdzlHDrWXcpp4+sn51VxpRPKnwViGRoQEta+q
         8TloReaMdKXYFjjwbxlQurGJUAT+6wgOy1JUE4ZGQnHVFN+szP+X8/dfv/IFWSjFILXX
         ZNzynivmEMH+8WMslZSqhtLKX3+yj7LkXlHtyJsLaT7kQ89/+mEgogi8dQics2qbO2TN
         f/JEo7ZeTsHskwyBnVcxBXgIc3wNB1OSOmRz6kJKkzKt9PB2mfZAoDqdUb8qKXMAnwDR
         wQvZqsh2kuTJLeL7W3yptwWRIV03XsRYiTmMJcaxLWvFYdaig9Lkxz7iztbbQDV6CkeU
         yklQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ4BXjyDJL3zYPo90wrBi51szerhZN6gCAQn8NFTYn/Q78vK/pU3kV5inAGkc3b97fzUvGEz9fwuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIkBrJQX6SavzebVBselJSl3Wi9DvLrRucpqPSlibCmD7OCGk7
	jnIDwVBlVAPe/DaIeKiDqXctQJHMXY5q2+6gDuCscdmLf8k1LOe8JNCwU2WeC9MtOcGba5Xry+r
	yOuAJB9txcySTiNE0gtbVDetK4r6Mxy4=
X-Gm-Gg: ATEYQzzlsuziVdrkZ7d/Zl+75v3gG0+fNk2CMaOPvQH7efNd7p0dwg9QpmGWzqVECgs
	GOkzIOyKAAxfhmpeDlTtAzXw/OD8HjS6OggZ3uLbGVtGf52dU2ZpdA3RW1nsvd4cW45CLC01fQD
	gpkxI307oDAjZmJILL9AHDCNgsP+fVh86It2sj8T/u28X9USQCs9xKH+PWqAbBif4cz8yQVmJSl
	9xmDGD0bJRcywvOzI2Dpt4InlV2xlJGreFk52vSyaPJQ0jijWsLMfVbEV72TYtWr5zCvwSOc+KH
	BQa1uLwG+yss+mizPk6lRWjzrCISHnK6amm/xkfRvRZsX7dZ1Aw=
X-Received: by 2002:a05:600c:450a:b0:477:5cc6:7e44 with SMTP id
 5b1f17b1804b1-483c2171795mr64134945e9.11.1772111239518; Thu, 26 Feb 2026
 05:07:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225114957.1094146-2-eeodqql09@gmail.com> <202602251259.B2F5E83731@keescook>
In-Reply-To: <202602251259.B2F5E83731@keescook>
From: Seungjin Bae <eeodqql09@gmail.com>
Date: Thu, 26 Feb 2026 08:06:43 -0500
X-Gm-Features: AaiRm52uhk553iDBdvuh2FGSBVobchQH4m3XSeQbGlGoZv_Rjncg9IkT5_z7gDc
Message-ID: <CAAsoPpWAeNWmGWaZHeWhuHGm9nUwueg-5TzyZaoyS_1Un91bzg@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: f_mass_storage: Fix potential integer
 overflow in check_command_size_in_blocks()
To: Kees Cook <kees@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Yuping Luo <Yuping.Luo@csr.com>, 
	Felipe Balbi <balbi@ti.com>, Michal Nazarewicz <mina86@mina86.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Barry Song <baohua@kernel.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33740-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,dartmouth.edu,wanadoo.fr,csr.com,ti.com,mina86.com,rowland.harvard.edu,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eeodqql09@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CD51A1A62A7
X-Rspamd-Action: no action

2026=EB=85=84 2=EC=9B=94 25=EC=9D=BC (=EC=88=98) PM 4:00, Kees Cook <kees@k=
ernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Wed, Feb 25, 2026 at 06:49:58AM -0500, pip-izony wrote:
> > From: Seungjin Bae <eeodqql09@gmail.com>
> >
> > The `check_command_size_in_blocks()` function calculates the data size
> > in bytes by left shifting `common->data_size_from_cmnd` by the block
> > size (`common->curlun->blkbits`). However, it does not validate whether
> > this shift operation will cause an integer overflow.
> >
> > Initially, the block size is set up in `fsg_lun_open()` , and the
> > `common->data_size_from_cmnd` is set up in `do_scsi_command()`. During
> > initialization, there is no integer overflow check for the interaction
> > between two variables.
> >
> > So if a malicious USB host sends a SCSI READ or WRITE command
> > requesting a large amount of data (`common->data_size_from_cmnd`), the
> > left shift operation can wrap around. This results in a truncated data
> > size, which can bypass boundary checks and potentially lead to memory
> > corruption or out-of-bounds accesses.
> >
> > Fix this by ensuring that `common->data_size_from_cmnd` is not greater
> > than `(U32_MAX >> common->curlun->blkbits)` before performing the shift=
.
> >
> > Fixes: 144974e7f9e3 ("usb: gadget: mass_storage: support multi-luns wit=
h different logic block size")
> > Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
> > ---
> >  drivers/usb/gadget/function/f_mass_storage.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb=
/gadget/function/f_mass_storage.c
> > index 6af96e2b44eb..12e7ef2e074e 100644
> > --- a/drivers/usb/gadget/function/f_mass_storage.c
> > +++ b/drivers/usb/gadget/function/f_mass_storage.c
> > @@ -1853,8 +1853,18 @@ static int check_command_size_in_blocks(struct f=
sg_common *common,
> >               int cmnd_size, enum data_direction data_dir,
> >               unsigned int mask, int needs_medium, const char *name)
> >  {
> > -     if (common->curlun)
> > -             common->data_size_from_cmnd <<=3D common->curlun->blkbits=
;
> > +     unsigned int blkbits;
> > +
> > +     if (common->curlun) {
> > +             blkbits =3D common->curlun->blkbits;
> > +             if (cmnd_size > 10 &&
> > +                     common->data_size_from_cmnd > (U32_MAX >> blkbits=
)) {
> > +                     common->phase_error =3D 1;
> > +                     return -EINVAL;
> > +             }
> > +             common->data_size_from_cmnd <<=3D blkbits;
> > +     }
> > +
>
> Can check_shl_overflow() be used here to make this easier?

Yes, definitely.
I will update the code to use it in v2.
>
> >       return check_command(common, cmnd_size, data_dir,
> >                       mask, needs_medium, name);
> >  }
> > --
> > 2.43.0
>
> --
> Kees Cook


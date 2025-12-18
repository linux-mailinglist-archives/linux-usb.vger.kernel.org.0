Return-Path: <linux-usb+bounces-31563-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B6ACC9FD5
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 02:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46B80301B805
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 01:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3990025EFBC;
	Thu, 18 Dec 2025 01:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="G+EX2sml"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DC223D7F7
	for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 01:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766021916; cv=none; b=b4Nq9WVCdOIY4NAihSjyIkHsys3JfKFU8dU5RK9L/RsWYnqcwTT2YcQe8zU0TYS4UMo7z2cATkJyEnia8jj3mdf+5VaS+QF4FreuAwqBAlYpCLHEpD9592BGo7fHF9HKkA5+2aDMqkGvdpR2hNvwuuS5CISAXmzwQGVQBX4zKMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766021916; c=relaxed/simple;
	bh=aHa+C0jYAbwg8X1uEBdutq7UF/INAv+FUqhgqnY3a0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hjSBp5iD2yfZvoNVb0vmCx4iheGoO97hJDcfjOkfcR9cq4KwdM6RV4o7XVdXIO4Kd0N5wuG56eYeOvF9W+l4J25Uf0M5xEWBiBkfTIWsYshDThZYSZPZRWAvMaL32DgmpjYcAUs2Eu59QvOcuHvmzFYC2CgHHAXn9JJfFfyhxuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=G+EX2sml; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2110C3F686
	for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 01:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1766021906;
	bh=/ijQCX+MNtx3W98HgK7EDgyBXSBnHG30l0q8EiJpkEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=G+EX2smlZLRyjiDXxfkbiPhydDj9pjdIG6mc5K/8YyVIy6E1wF3/Nfb1JdbbceDyT
	 /ggSzTJbC/xXQO4ZZNsisaL6vx6vijCwg+i79moGVrnHHUfYC4bK5wICZrFawS34IG
	 p4iKYqYkzBHQYwVcxeNIYYiv1BD2BvaYWMGbmRUfp3Q985HDJOkJyK7PXdK/knOcKU
	 diRbx/ZrwbK3CMN8Z648HCN03S/glNIrsgQG+tg3hkVp3iyADidr6T8qaZvM3040IL
	 APB2DJMvjGs9xjVSdPtHhPi9LdYtCSvKDErGHiCNZnlEWcZD+4ZhMPv6HcnM3eHa0Y
	 N+BRANfgKRN7PuTRedHmUItbf2VPRYbj1U1KmuWATmCXGjbMKDtHJ2wzSI9BTouw0t
	 27mSpsiRCI2pI0AHnDsKjIjDCfu25jqnGew7yEyq7Laj2aftp2+qcgDb2RGOWYWqMW
	 yfbVvvGLi04uDiA7E6x18ys1H3CGrm6kjPYbCewy9cA2iGCv/FwpKVKOZjhQFjJO/X
	 bBuYjQOJAP1KJ1atI46zeUEGQ0Oc/ApXVhVRc3z7KJjK7/8hhvSVVR84BSI/tiZMck
	 7cMLGtrmEaiecZxCKKqJQXKbUDNXkH3Uc1Q/u5UM/5yrH74n4Zbv+bFeeHie/Kcx+X
	 EGiElRy2OaKzjUZtRMg4btuU=
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-647854f707bso1695102a12.1
        for <linux-usb@vger.kernel.org>; Wed, 17 Dec 2025 17:38:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766021905; x=1766626705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ijQCX+MNtx3W98HgK7EDgyBXSBnHG30l0q8EiJpkEs=;
        b=iIitHFosiuVPQMoEKB10QnSSjRd48S9qLBFrrjXAWGIo4Po0zYNz4l4MBepZRZsYgc
         t4dru9rw+t2dS4obzKvILuL57LP+Y4Ler8svzD0raL5qTAIZLfsXF4P4GgC1okSJAASR
         Zkh2uaOjbzdbrv8KPd9qpGQJJ+virZkGdkZ/59whZJXbgy79WMLtXqE/Hsm2u727cWry
         TktASOTdRLbQNclJ9q+2bG8prAvvOb7EcqOCYhKhSzr6hELDwH+kj3XjsD+Uelm3Oa/H
         zD0qZC1++4rHQQqKNmlQZmEBiGhWbcttQcLpFnzRqSAOfz4fgXYU0SXEarwLUI/IT3U3
         9Pig==
X-Forwarded-Encrypted: i=1; AJvYcCVRI6TxzjK/lAz+YEzMfrt8EHWtB69K1rnNVW0aVdSvbaqkblYRWQXdBx1IP54KwDinlylTVi7RFqA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2pm4AjqAdDBDF8A5rte8bOdqnDjeTJtMkyz5136UlQhTAVlp4
	4k9CV3eivKDUW+EfWfXDSZ4RiLrgfMQZ4rOhIwCjWNQjeoH/KbAF7rcWq3TKN/D0rp/syLMU1DT
	49/nHStRGY4eNgKsh6xQdOs2aPYxo9KS+XDQIWXyAmkr4cY98cwiGLfksh3i/eKacELGHVDTQeo
	KQKGToQd7btJsBxTRcq4ZLwtzaixFukQQ/cHLbFJ6l4J9aJ27LTy/L
X-Gm-Gg: AY/fxX6wlErSrXkVVo9SeiuHAW6maC422yQ0vQ70d45DNtr6Dg1QFdmfRwfmuW5RbuK
	6L60tRTIIxF6nzZPsgR9GNAXbkw7Mw6UbwGm5tLlv5B7A2RTZznP1J2LJRPLtC6OXJqkEPKB2Xy
	UmYTUogxpz1t9t54kLxjBJjsazxBT6cnavTXPR/l9fS+SjNHmsdqpmhKdxRpNnTjA+3U8=
X-Received: by 2002:a17:906:3194:b0:b76:b791:b58f with SMTP id a640c23a62f3a-b801ff9bcc2mr97507366b.0.1766021905586;
        Wed, 17 Dec 2025 17:38:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHad9jckdqmmFlTyutiv54ottbPBIASuJEfqweunCdwIZfUvMhtc1f5ohYmaPlH+zt+qXJavwWhviY83w+J5yc=
X-Received: by 2002:a17:906:3194:b0:b76:b791:b58f with SMTP id
 a640c23a62f3a-b801ff9bcc2mr97506166b.0.1766021905087; Wed, 17 Dec 2025
 17:38:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251209054141.1975982-1-acelan.kao@canonical.com>
 <20251209070633.GA2275908@black.igk.intel.com> <pjn5d7oz433z4jph6whdalhowf652xknnk2fh5q7elffgb5ogo@7dtpvywxc6nw>
 <20251210074133.GE2275908@black.igk.intel.com> <4634177b-8ed1-4d65-9f3c-754d8c1eb828@amd.com>
 <coxrm5gishdztghznuvzafg2pbdk4qk3ttbkbq7t5whsfv2lk5@3gqepcs6h4uc>
 <20251212123941.GK2275908@black.igk.intel.com> <484ff606-ec10-477c-acfe-d4d781e2873d@amd.com>
 <CAFv23Q=bLCif750y8eDEP4J+KwVy8CknZawYOGZWWrBSiE8FNA@mail.gmail.com>
 <20251217125507.GR2275908@black.igk.intel.com> <5d7f2661-f02b-4985-b438-196b48c10237@amd.com>
In-Reply-To: <5d7f2661-f02b-4985-b438-196b48c10237@amd.com>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Thu, 18 Dec 2025 09:38:13 +0800
X-Gm-Features: AQt7F2rYooN6PmmghNAR7Dx-hx_9IF9oB5RlqIO5t62YjI_c5iD6JT0xR331uOc
Message-ID: <CAFv23QknLmZkC9Fc0FTFKCofngRUQipw4hGVG_P2k+TUb=KOeA@mail.gmail.com>
Subject: Re: [PATCH] [RFC] thunderbolt: Add delay for Dell U2725QE link width
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sanath.S@amd.com, 
	"Lin, Wayne" <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mario Limonciello <mario.limonciello@amd.com> =E6=96=BC 2025=E5=B9=B412=E6=
=9C=8817=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8811:53=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> On 12/17/25 6:55 AM, Mika Westerberg wrote:
> > Hi,
> >
> > On Wed, Dec 17, 2025 at 11:06:52AM +0800, AceLan Kao wrote:
> >>>> By default it does not access retimers beyond the Type-C connector. =
I
> >>>> wonder if you have CONFIG_USB4_DEBUGFS_MARGINING set in your kernel
> >>>> .config? And if yes can you disable that and try again.
> >> Sorry, it looks like I got some troubles with my MTA, some emails are
> >> not sent out correctly.
> >>
> >> I've rebuilt the kernel without CONFIG_USB4_DEBUGFS_MARGINING, and
> >> here is the log
> >> There is a tbt storage daisy-chained after the tbt monitor, it's
> >> easier to reproduce this issue.
> >> https://people.canonical.com/~acelan/bugs/tbt_call_trace/intel/merged_=
6.18.0-d358e5254674+.2.out
> >>
> >> And this one is only the tbt monitor plugged.
> >> https://people.canonical.com/~acelan/bugs/tbt_call_trace/intel/merged_=
6.18.0-d358e5254674+.3.out
> >
> > Okay from the first trace at least scanning of the retimer at index 2
> > (which does not exist) does not complete too fast and I suspect there i=
s
> > some timeout on the device side that triggers. We had already similar w=
ith
> > Pluggable devices but perhaps this is implemented in the Dell version t=
oo?
> >
> > I wonder it is enough if we set configuration valid and then scan the
> > downstream retimers? Can you try the attached patch? We do need to scan
> > them before DP tunnels are created to support ALPM (this is work in
> > progress).
>
> If it needs to go even later - there is OFC the possibility of doing
> upstream ones first and USB3 tunnels first too.
>
> I'd say if the below doesn't work Acelan you can try pushing it right
> before tp_add_dp_resources() to see.
Hi Mario,

It's still no luck to move tb_retimer_scan() right before tp_add_dp_resourc=
es()
https://people.canonical.com/~acelan/bugs/tbt_call_trace/intel/merged_6.18.=
0-d358e5254674+.patched2.out

>
> >
> > diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> > index d7f32a63fc1e..e23e0ee9c95f 100644
> > --- a/drivers/thunderbolt/tb.c
> > +++ b/drivers/thunderbolt/tb.c
> > @@ -1380,14 +1380,6 @@ static void tb_scan_port(struct tb_port *port)
> >       upstream_port =3D tb_upstream_port(sw);
> >       tb_configure_link(port, upstream_port, sw);
> >
> > -     /*
> > -      * Scan for downstream retimers. We only scan them after the
> > -      * router has been enumerated to avoid issues with certain
> > -      * Pluggable devices that expect the host to enumerate them
> > -      * within certain timeout.
> > -      */
> > -     tb_retimer_scan(port, true);
> > -
> >       /*
> >        * CL0s and CL1 are enabled and supported together.
> >        * Silently ignore CLx enabling in case CLx is not supported.
> > @@ -1406,6 +1398,13 @@ static void tb_scan_port(struct tb_port *port)
> >        */
> >       tb_switch_configuration_valid(sw);
> >
> > +     /*
> > +      * Scan for downstream retimers. We only scan them after the
> > +      * router has been enumerated to avoid issues with certain
> > +      * Pluggable devices that expect the host to enumerate them
> > +      * within certain timeout.
> > +      */
> > +     tb_retimer_scan(port, true);
Hi Mika,

This doesn't work.
https://people.canonical.com/~acelan/bugs/tbt_call_trace/intel/merged_6.18.=
0-d358e5254674+.patched1.out

>
> Just a note in case this turns into a proper patch/solution.  Make sure
> you update the comment to cover this monitor too.
>
> >       /* Scan upstream retimers */
> >       tb_retimer_scan(upstream_port, true);
> >


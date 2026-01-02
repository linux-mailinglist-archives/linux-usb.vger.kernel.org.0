Return-Path: <linux-usb+bounces-31868-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DBCCED9A3
	for <lists+linux-usb@lfdr.de>; Fri, 02 Jan 2026 03:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0DE43007972
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jan 2026 02:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18FB9215055;
	Fri,  2 Jan 2026 02:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMRlTZ0T"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51DC481B1
	for <linux-usb@vger.kernel.org>; Fri,  2 Jan 2026 02:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767319402; cv=none; b=X9aN4MYBhfhPthNXpjiCTvEYKJTCnX4yX4IOs8u29+6j8IszXhJ5GFA/UcHD4UDJ3612G+Tkot15bVNprYUrtXUy3pXN0B/UzQQDBsr1io+HeRmZvS9iD4yNVjBPOvGzWCRCzYO7KunemRBuvp3qoEyIVX401Jil9xqEw/Ky7x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767319402; c=relaxed/simple;
	bh=FKYICOpJuLfGPv4CnRM+ASaF63lVEzKEDNXt71p5uFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oyg4kHoXHIddoft+pvcl6g7WlYoKIUh6wmidJlH01kVav1IjiA+Hv8SNbjjeCvPMPfrHOKQqDWVtKBjx1U1V9LOM38zLznDOumOg62Tl2HBnD8XyrcFgiH+3xkPC9zruFPapoarOMctOQbtwMkBH8uqD729jPuhj1Gb8AY364do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMRlTZ0T; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47774d3536dso94767255e9.0
        for <linux-usb@vger.kernel.org>; Thu, 01 Jan 2026 18:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767319399; x=1767924199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CdH5Vm1BhJb/MNRx9vVp4UM86YN/ZGRx2rBJ9dq048U=;
        b=DMRlTZ0T/WIYrzaGZBSmE4/yL71bBJgx9I1vcMsegQNMevpFeNe1dpEMvMkNUVlYnb
         f7Ejr3tpCUAJo8/VaWtHn54+AeF/jZ2C6WpolW1aZgbQcKM0WCr+/OH+TLQZ0U89wLfE
         F8foQL6JzHoSRPK5VuPlEZGt9S1MEfn2y9yr2fSIGfxji2W1QkgOiYIpvKn3XwrT81EZ
         B8OqRDsAY0+qkswXcbUUlioixbD4r0ps53++TkpLhE+LjoOh4kYNpRpf5QtEFoEBqF00
         oblXpo/GKy/EoOJ/mDYoxdb+fGF1x4FvIIRN0RfadskD2Xb+UGAFfPqPOVDbr/9ayVRV
         fpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767319399; x=1767924199;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CdH5Vm1BhJb/MNRx9vVp4UM86YN/ZGRx2rBJ9dq048U=;
        b=EWo2OAutjoJyMtxEfX05BcPcKAXZ6At92VbY4bknIoxsuuHshLvOaGv1xmC+QwDRpK
         bdNf9q57ZN/oxs2hi7k/O69STOUZy8BeTB1v7oHt7lUyhlXfvpFfFjreMO/fqIDKeoDB
         yToUD8HZe9S//y2Z9je6S6EDe5D3qzYdFnArOT5yQT4CgsDyM35w+MNnyjodez2sWnrj
         4ckz/RuWKodGEBbEs4G1Os490rZGDc7qClBXb9riQz5qHyXYfxZjHO/zJnx3OGSoJ3Pi
         6y7h1XavfTqTxfuQJIeYjNzuv793aTTveb8AK6t2VPiDVhQ2YA+G3tCVgcgcBxdRSpeO
         IsBA==
X-Forwarded-Encrypted: i=1; AJvYcCVFAMRETUiQljeAPRxv920yCFPyI7FcOvWzS6jqqz54LZ2hnlpeo8vMdxqzvBrtm9zpOo8w/Qv/wD4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr9dkh7BhvOaZ4Lk0FuTMGWo3osGCbPLT/iA3kYX3XsbdY59aP
	6JDOxoEzXZDRGnghSG6E2weRAtTLX7YV54LYm+LhF6OSxMoxG0zBbiUT
X-Gm-Gg: AY/fxX6bO0nhNkUtwnOIfjO4xXeygFxe2P5yzPJkP8dWFGljXid9FTJNIDnQXn2qBZN
	YngIiQIouoVbTQRSu5/fexzHc17PKB01ALFjEOZHFpM0MMZZ20Ls9YQGIdWx/Ay9hjL4yb25zuB
	9Wz90gLpAA4JFnl+kbXhT1wTY+PyqzRH+/nFu761gK0yK+s9Bxj1ymKapyaF8zgiC9/Q6HE9egY
	U+ASlWHhaEnRQJxJITk5LgaqvEecOLOtOqRjBQ+/b+zBFIpwEy/9tsE/TEgkFnHunKqHqg2wux4
	nmXhcerveS6cuKswlegvjbDFZJb5gj96G0F9gaxv/BWq7husT5xXZLMWssMBlDtqIr+VmiJsa9z
	FJ96B3tgRfdcYkw1cdXpCFU+P5XtA6qZe+q7G7JOTgGB7BFdyNuMDQo4dJUb1juEvRzgK2viczD
	1r88mRvsENrZaRESk=
X-Google-Smtp-Source: AGHT+IFpro7R68Vu6aGPjCouAl8s2dfmVmY6kyTLa5E6WPPt8sIPHheX0NKy6lTqXZhHoZvBMxVZQQ==
X-Received: by 2002:a05:600c:4695:b0:47b:e417:9056 with SMTP id 5b1f17b1804b1-47be41791b6mr555751045e9.10.1767319398877;
        Thu, 01 Jan 2026 18:03:18 -0800 (PST)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2721sm81712858f8f.39.2026.01.01.18.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 18:03:17 -0800 (PST)
Sender: AceLan Kao <acelan@gmail.com>
Date: Fri, 2 Jan 2026 10:03:12 +0800
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
	Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sanath.S@amd.com, "Lin, Wayne" <Wayne.Lin@amd.com>
Subject: Re: [PATCH] [RFC] thunderbolt: Add delay for Dell U2725QE link width
Message-ID: <xgreoxrfzdgeupv4q7ge7ivjwz7dll7khohm4wetjjm3waztwo@lrr2kjdjpdba>
Mail-Followup-To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sanath.S@amd.com, "Lin, Wayne" <Wayne.Lin@amd.com>
References: <20251217125507.GR2275908@black.igk.intel.com>
 <5d7f2661-f02b-4985-b438-196b48c10237@amd.com>
 <CAFv23QknLmZkC9Fc0FTFKCofngRUQipw4hGVG_P2k+TUb=KOeA@mail.gmail.com>
 <20251218072125.GU2275908@black.igk.intel.com>
 <6inne3luvw4ot3wqnsaw3gzhlxtd4756i465oto6so5ox3syxp@kibuv4vhvexx>
 <20251218102021.GV2275908@black.igk.intel.com>
 <wqc6xvaeebqb5skiba3gpekdpmf3yz2zk3maeqprdtdpglvhww@za2efpacwhzo>
 <20251230073011.GD2275908@black.igk.intel.com>
 <7u6z5gp5ma2jg5zzxniupu4zuipjgxgnjydltx5cntikjtf3ww@qb62nuy7jsfk>
 <20251231060333.GK2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231060333.GK2275908@black.igk.intel.com>

On Wed, Dec 31, 2025 at 07:03:33AM +0100, Mika Westerberg wrote:
> On Wed, Dec 31, 2025 at 09:33:15AM +0800, Chia-Lin Kao (AceLan) wrote:
> > On Tue, Dec 30, 2025 at 08:30:11AM +0100, Mika Westerberg wrote:
> > > On Mon, Dec 22, 2025 at 09:33:48AM +0800, Chia-Lin Kao (AceLan) wrote:
> > > > On Thu, Dec 18, 2025 at 11:20:21AM +0100, Mika Westerberg wrote:
> > > > > On Thu, Dec 18, 2025 at 03:35:05PM +0800, Chia-Lin Kao (AceLan) wrote:
> > > > > > > Now since USB 2.x has its own wires in Type-C cable this tells me that
> > > > > > > there is some real problem with the connection. Have you tried different
> > > > > > > cables already?
> > > > > > Here is the log I got with another tbt4 cable.
> > > > > > I'm using the kernel with Mario suggests modification.
> > > > > >
> > > > > > https://people.canonical.com/~acelan/bugs/tbt_call_trace/intel/merged_6.18.0-d358e5254674+.patched2.2_new_cable.out
> > > > >
> > > > > Here I see (assuming I read it right) that the USB 2.x enumerates only
> > > > > after the first unplug:
> > > > >
> > > > > [   28.589861] usb 3-2: New USB device found, idVendor=1d5c, idProduct=5801, bcdDevice= 1.01
> > > > > [   28.589864] usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > > > > [   28.589865] usb 3-2: Product: USB2.0 Hub
> > > > > [   28.589866] usb 3-2: Manufacturer: Fresco Logic, Inc.
> > > > >From the logs, sometimes this hub is enumerated before the call trace
> > > > and then enumerated again after the call trace.
> > > >
> > > > And I also found there are some suspicious USB disconnections while
> > > > plugging in the tbt monitor.
> > > >
> > > > I tried to avoid the USB disconnection by the following modification,
> > > > but still no luck.
> > >
> > > Okay but I think this is not a SW issue, rather an issue with that
> > > particular monitor/cable/connection/PD. It is not just the USB4 link that
> > > goes down it's the whole type-C connection therefore something is wrong on
> > > the electrical side of things (well at least it seems so).
> > If that's the case, would you agree to suppress the scary call trace
> > like this?
> >
> > diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
> > index f9b11dadfbdd..ae7127eca542 100644
> > --- a/drivers/thunderbolt/path.c
> > +++ b/drivers/thunderbolt/path.c
> > @@ -586,7 +586,18 @@ int tb_path_activate(struct tb_path *path)
> >         tb_dbg(path->tb, "%s path activation complete\n", path->name);
> >         return 0;
> >  err:
> > -       tb_WARN(path->tb, "%s path activation failed\n", path->name);
> > +       /*
> > +        * -ENOTCONN can occur during transient hardware states like lane
> > +        * bonding or when the Type-C connection has electrical issues. The
> > +        * hardware may automatically retry by reconnecting. Use a regular
> > +        * warning instead of tb_WARN to avoid generating call traces for
> > +        * these expected transient conditions.
> > +        */
> > +       if (res == -ENOTCONN)
> > +               tb_warn(path->tb, "%s path activation failed (port not connected)\n",
> > +                       path->name);
> > +       else
> > +               tb_WARN(path->tb, "%s path activation failed\n", path->name);
> >         return res;
> >  }
>
> Yes please but make it unconditionally do tb_warn() instead of that
> tb_WARN().
Got it.

>
> > > Dell also typically validate that their stuff works in Linux so I would
> > > expect to got some report from them if that's not the case (unless you are
> > > doing just that ;-))
> > Currently, the issue could be reproduced on the AMD platform every
> > time when plugging in the tbt monitor. We don't report the issue on
> > Intel platform yet, because of it's low failrate.
> > And the issue is not critical, as it can be recovered after
> > re-enumerating the monitor.
> > So maybe they won't bother you about this issue.
>
> You only have one of those monitors? It would be good to check with another
> if it has the same issue. I have GR reference device here which is what
> this monitor is based on but I don't see any unplugs or link issues. I will
> ask around if we have somewhere this monitor.
Here is another BenQ 5k thunderbolt 4 monitor, and I can't reproduce
the issue with this monitor, even with the AMD machine.

https://people.canonical.com/~acelan/bugs/tbt_call_trace/intel/merged_6.18.0-d358e5254674+.benq.out


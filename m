Return-Path: <linux-usb+bounces-31853-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6404CCEAFF9
	for <lists+linux-usb@lfdr.de>; Wed, 31 Dec 2025 02:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 18B6E3007669
	for <lists+linux-usb@lfdr.de>; Wed, 31 Dec 2025 01:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0712B1DED49;
	Wed, 31 Dec 2025 01:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrH3eG5/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CBC145FE0
	for <linux-usb@vger.kernel.org>; Wed, 31 Dec 2025 01:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767144801; cv=none; b=EwVDq8SzwaqCJ55lB/OA70ucGo7GLZTgbbaG/q3AU9zquX+uEgwLACQRxdro+WtkwPvUfthyt56TGQI9hZQ9PuMaa0Sdz86iKBvuvQoNInoubkwSZ0mxU832T4Q4UXPnXI5xoP2CoOV1G9CU8/4oALbcuHJ+fTfbdpRgpCZottY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767144801; c=relaxed/simple;
	bh=AASjMsAURBhicp2aLAGz/Hws2RKw87MD3ELXENIUPUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJyUFL2QzoSi8dq+f257KbQLUOVQ6qVjbWRxEdSU8hV2BsTxziB15Q8k/CO269cqfwqLmNwwnBYlmh2uR4BEAIhfpWxr8leS0hJfWQ45ZLnBhIaqHbKst0np1wZyI0IgsUc/h+NXAXnBxFcpdaZNaO7clO6MldlPQ6NBk4Oftoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrH3eG5/; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7fc0c1d45a4so9278573b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 30 Dec 2025 17:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767144799; x=1767749599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3w1y2CGjthBDu5Xu262kIoWSxExArK+cDL2xXhBRHF4=;
        b=LrH3eG5/WSxp+MNbdctN0AfpHit08/gRUtDvtp9E60DZcBk3WoppjsXYHSbHuzmAG5
         e2OcVmce3t7Bm248+ImOpcslZwyPfF0R4jyKHU/nFE8nz9/2DEOzNDmoe2cRWEW0JwQy
         ImIUX4YEF+5nFlQ/Ku551tfNFZ3isQqLpuW4OQN5qnRZZmVPl1cXgxzGJdA6VEzkTc2J
         q8S9qGv1M8iJj93FPspTo1oeU7JHtZYtLL+810MdUcjCJMDks0kQKcItVrW0eadVZh9/
         VBaTy/FTQViMUkA3frmS8MTuzgbPVFMi+JV0cl79yrqDHS7zhbYFv2qbNQ7HU6sEhh3C
         ywzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767144799; x=1767749599;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3w1y2CGjthBDu5Xu262kIoWSxExArK+cDL2xXhBRHF4=;
        b=JwFcYyDGFtqqsU0XssyBIIUzSgVdZ7CJWoBpI7G4mGrMMuTEdm4dfFOz154oFasFcL
         WJeKVXtXqqE+PeFdvag7o1ZuIg8zEga6YQC1BNDGF8mFWseUgtsH/rzirHdXETRw3s0B
         Wo05qNc1HLxlWuUDh0iG0VXseycswfFFJlvPByYhgXcwsn2dnjUVTk/rU1qg7nKMT0+M
         VYnXOXeLngCJittFzvtZYOTYJdiF2OrDf75G+9yMB80yMRxsFtD5E/gZgx//jsejlyz7
         kLfSd2UdiOvbU0L1g1+tUgWnuwe0cOZRpOAfcLHGtlXHq37M0o8mxHbicgnhAFotJ5Cj
         Mwsw==
X-Forwarded-Encrypted: i=1; AJvYcCUor5nXrFB9WOMm+6mt3YeayrJ2art7nt48Dziifq74UfbHQf4mlxf+mfmbYZhXAX+7qEjBNTfOcXM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza+pH5pJ7uiXgc8HlSpwQ/snP/FRRvh3DPcTDpWWfJ33Ssqaif
	tbcxxPcbMHlgOtB5ull8rdDFPYpMUiCgq0rh30WKL+cj00200w6lP4ZE
X-Gm-Gg: AY/fxX5STs9aTRbHGJ1gFcI/0KFW8rvh1musOwoYzoulxYNLo7gxc7uoKMZlXjYQMKW
	nEFnmq2/xcrI3IQEKS9POZ4U8nnF37YzdiE3CKr8ILTzQFgB6KbyM7Of/SZxiAB6i8Fax1W9tcZ
	mkYzSovGMIncVMHICcfFBP9Bsn4UWjnel6GW3J7HCAJKLTxIrb5ZgSJ04rsO2RjBbWSaQMYaB4r
	9X/zXKdYeLyovIqS6VzyxTV9cdBJ7H99Pv5keclShnYq0agmCTM+xpge4mmQHILue1IxiQtrT5N
	T0t7C1Ey/FON79rXBQ4gcZ7528SIDbwej9yCu2a/H7sw5C7oxCvbWraV6jaDpd4Kf5mvVyEyD/s
	fkaxNgKdm803nJ2rWKKSnSLcedzFLjGE7Hrf5nZ1rTQ+lnbjIPE0fhwsqGZC436MczKPD2cMB4f
	qYOJxOpTq9bRBvJeJXVAWLLAE0Jr/5dapjB2v9ohR2rnm0qyr/FGkVyyL94PhWEw==
X-Google-Smtp-Source: AGHT+IHfWTcw/yEWotlY1sv9B8+szuuJAVdD7zEpmnRr1G71QnOut1bbCO9jp+wYcQBVkucbC6L5KQ==
X-Received: by 2002:a05:6a21:32a7:b0:341:9db0:61f1 with SMTP id adf61e73a8af0-376a7eed472mr30399634637.16.1767144799049;
        Tue, 30 Dec 2025 17:33:19 -0800 (PST)
Received: from localhost (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d77566sm313973205ad.97.2025.12.30.17.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 17:33:18 -0800 (PST)
Sender: AceLan Kao <acelan@gmail.com>
Date: Wed, 31 Dec 2025 09:33:15 +0800
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
	Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sanath.S@amd.com, "Lin, Wayne" <Wayne.Lin@amd.com>
Subject: Re: [PATCH] [RFC] thunderbolt: Add delay for Dell U2725QE link width
Message-ID: <7u6z5gp5ma2jg5zzxniupu4zuipjgxgnjydltx5cntikjtf3ww@qb62nuy7jsfk>
Mail-Followup-To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sanath.S@amd.com, "Lin, Wayne" <Wayne.Lin@amd.com>
References: <484ff606-ec10-477c-acfe-d4d781e2873d@amd.com>
 <CAFv23Q=bLCif750y8eDEP4J+KwVy8CknZawYOGZWWrBSiE8FNA@mail.gmail.com>
 <20251217125507.GR2275908@black.igk.intel.com>
 <5d7f2661-f02b-4985-b438-196b48c10237@amd.com>
 <CAFv23QknLmZkC9Fc0FTFKCofngRUQipw4hGVG_P2k+TUb=KOeA@mail.gmail.com>
 <20251218072125.GU2275908@black.igk.intel.com>
 <6inne3luvw4ot3wqnsaw3gzhlxtd4756i465oto6so5ox3syxp@kibuv4vhvexx>
 <20251218102021.GV2275908@black.igk.intel.com>
 <wqc6xvaeebqb5skiba3gpekdpmf3yz2zk3maeqprdtdpglvhww@za2efpacwhzo>
 <20251230073011.GD2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230073011.GD2275908@black.igk.intel.com>

On Tue, Dec 30, 2025 at 08:30:11AM +0100, Mika Westerberg wrote:
> On Mon, Dec 22, 2025 at 09:33:48AM +0800, Chia-Lin Kao (AceLan) wrote:
> > On Thu, Dec 18, 2025 at 11:20:21AM +0100, Mika Westerberg wrote:
> > > On Thu, Dec 18, 2025 at 03:35:05PM +0800, Chia-Lin Kao (AceLan) wrote:
> > > > > Now since USB 2.x has its own wires in Type-C cable this tells me that
> > > > > there is some real problem with the connection. Have you tried different
> > > > > cables already?
> > > > Here is the log I got with another tbt4 cable.
> > > > I'm using the kernel with Mario suggests modification.
> > > >
> > > > https://people.canonical.com/~acelan/bugs/tbt_call_trace/intel/merged_6.18.0-d358e5254674+.patched2.2_new_cable.out
> > >
> > > Here I see (assuming I read it right) that the USB 2.x enumerates only
> > > after the first unplug:
> > >
> > > [   28.589861] usb 3-2: New USB device found, idVendor=1d5c, idProduct=5801, bcdDevice= 1.01
> > > [   28.589864] usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > > [   28.589865] usb 3-2: Product: USB2.0 Hub
> > > [   28.589866] usb 3-2: Manufacturer: Fresco Logic, Inc.
> > >From the logs, sometimes this hub is enumerated before the call trace
> > and then enumerated again after the call trace.
> >
> > And I also found there are some suspicious USB disconnections while
> > plugging in the tbt monitor.
> >
> > I tried to avoid the USB disconnection by the following modification,
> > but still no luck.
>
> Okay but I think this is not a SW issue, rather an issue with that
> particular monitor/cable/connection/PD. It is not just the USB4 link that
> goes down it's the whole type-C connection therefore something is wrong on
> the electrical side of things (well at least it seems so).
If that's the case, would you agree to suppress the scary call trace
like this?

diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
index f9b11dadfbdd..ae7127eca542 100644
--- a/drivers/thunderbolt/path.c
+++ b/drivers/thunderbolt/path.c
@@ -586,7 +586,18 @@ int tb_path_activate(struct tb_path *path)
        tb_dbg(path->tb, "%s path activation complete\n", path->name);
        return 0;
 err:
-       tb_WARN(path->tb, "%s path activation failed\n", path->name);
+       /*
+        * -ENOTCONN can occur during transient hardware states like lane
+        * bonding or when the Type-C connection has electrical issues. The
+        * hardware may automatically retry by reconnecting. Use a regular
+        * warning instead of tb_WARN to avoid generating call traces for
+        * these expected transient conditions.
+        */
+       if (res == -ENOTCONN)
+               tb_warn(path->tb, "%s path activation failed (port not connected)\n",
+                       path->name);
+       else
+               tb_WARN(path->tb, "%s path activation failed\n", path->name);
        return res;
 }

>
> Dell also typically validate that their stuff works in Linux so I would
> expect to got some report from them if that's not the case (unless you are
> doing just that ;-))
Currently, the issue could be reproduced on the AMD platform every
time when plugging in the tbt monitor. We don't report the issue on
Intel platform yet, because of it's low failrate.
And the issue is not critical, as it can be recovered after
re-enumerating the monitor.
So maybe they won't bother you about this issue.

>
> Have you tried this same monitor with Windows? Do you see the same issue
> there? I would expect so.


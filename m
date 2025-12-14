Return-Path: <linux-usb+bounces-31430-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E605CBBB1B
	for <lists+linux-usb@lfdr.de>; Sun, 14 Dec 2025 14:17:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 62EFA3009DB9
	for <lists+linux-usb@lfdr.de>; Sun, 14 Dec 2025 13:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD6A22D7B9;
	Sun, 14 Dec 2025 13:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fS6rKOxE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280E62A1BF
	for <linux-usb@vger.kernel.org>; Sun, 14 Dec 2025 13:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765718266; cv=none; b=smW5WI9I/AzjZEDrNzXFClpo49THQ8ToU8KJSD+4SVgFXyp8EsqFDqfe1kUW6pr03knhFBGq49NRGceSoxOFiiXEf1Gp6rw7qc3XoYsNdScddJyvJ8mr+rDUGLb1kgWVeDuuR/dKA+JnjzPDQo0eW6HfDHcAir4WmEgWBwpsv6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765718266; c=relaxed/simple;
	bh=XmtOq1WlOXv5tvapcKs/oIm0cZgNGon3Gb1VCrDVVgw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fjlDbR43TNNYjWQPVrGM/w/Tk0YYn+OyUwkaDCjP1sbPYSj8obSGZ3KzK3e2BTzaOX7MO80L+RYf64H26Q0zrm5TQbkPzYL9eVzFOJ6K+Hrx9rnmQ7soGSGfvOhpAGlM0MH+U5s2Ysi0P63RshLeP7wO2urFnkjkYsAC+wYWZiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fS6rKOxE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47118259fd8so26734545e9.3
        for <linux-usb@vger.kernel.org>; Sun, 14 Dec 2025 05:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765718262; x=1766323062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpywd0ooBqabRS+5lH7EYtrqn3sd1kp/pArhDDLgKLk=;
        b=fS6rKOxECWqFG4sVcdaFbufZFN0mNF9qFZ7VjjqnN2KZvEygJpFhJLZAxt6NvZLFVu
         f+DTEadQhuz4AekF2cWxUtc6075GBBhfbApDp9/0MkXytirYBLDLrsEkIpf3RmmSUoFY
         8tcMQNJd0mGu4nsxXGfrhywKa38I1GfrSwBJGNcYbeh/8r4lexXrBsGXlAkT87Sds8Kk
         nH2liVbqLto6rS6LS8W2358HZ8t5i9WjGSzZxZ7OoxpYuLrwKqYZlj+hDenqkQNvMuzh
         CNOG/kWR9nYlRX+m2jvmUVrJEBsmVFXfaElXRHb5q/Qm5XLoW3cxaNskk7RcpcLhz3OJ
         vePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765718262; x=1766323062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mpywd0ooBqabRS+5lH7EYtrqn3sd1kp/pArhDDLgKLk=;
        b=oCKvcOcdtDO2+OsXL+0fi/uzSGbnJ5DIa5lwJXp1NjBsslEtSbmpuMMB/mgNACwf9e
         SFcu3v01JNwf0oL0jd+CPtBvKuZCWacJStWvua4IaOZfmzPF3MSaE+93mrbMNRa+T4Zo
         VAxQ5324nXzmpb2lR1R2WB1x4aQfkgH0iKpyB7LyNC2Fjy/SP6jEe+KW/zsV75Muj2Nn
         ttg91Ku9i32n3rs3c5PLX5Hc5wMaWF7uALzAg69KgDEvmDRoykJZc4ckwWxxcGJQ7WIc
         oyBJRE1KG423tafGPNaZjv/dxSYC2IShbR5L8Obz7JMKbCiNQegPFpo3rzmNVuEgzOQ4
         1DWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn90zHP2pK+aoooGr0AEeUm59T/pTSn98aty8coubj6EzVWQutUf526NC6zy9Z94NWLzjrRUjui5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPuSqEKzre7TpEOab6qW6/UbjK6XLcgh8yc2le3bQfeF/sMQfR
	fdyzH8PVPeo1DFscFIFO47mBycowWT9qYbrzLM5KJOHEOt+z3NmuJIhY
X-Gm-Gg: AY/fxX4zSAzEIj4lh1HUWaR98cQbspT4r/MlLe8OB0rm/TTYZSHv162+/fCI8fIWEQl
	nWA4euPYeaGpAdDY/G3/5QELhYGYg+8pkL/BnfOYEG9Zraj9wRGE43gN7Lfz/PIMBLSTTO54yhe
	w9zoUxvuiyWFBkapqRvSkscjZM+x+GuzyYaGufKvmb27MkEfe1Avgy556of/7PgtT2Shc1FPc3Q
	8W2jyUMBnf/jzA1ac5V/iB3VULOUakeOzvB871bC2YAUne0e+jaq3fWI5Oucg7HqIQVu3qh7dS9
	cCr7qxXG/LlCVWuNdSDbTTlAj6ZlGhzuUR2Q8hiofXfW+7G8T9eh1fV9J3s8eP9MiUldzgcYPLI
	+inKIiIgbGwhs9j2YBNBaHtTBWlrRja2hzE7ZwHiTlK9SMRqp0cWbXQf7thhIBaI8rBpApcKYSz
	snSpXd6SC8IEp2zHGbMmeOydV/BAfeqPJmCEKwQurF6cLocOJLgLjW
X-Google-Smtp-Source: AGHT+IHTX2KIoo6rHKnWJhWyrUXne9SI979vSJQ8O09DKd6yhp5jXCNNQXUTEJFhlKpFkjoCo3wQwg==
X-Received: by 2002:a05:600c:a009:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-47a8f8c4b8emr81227825e9.13.1765718262416;
        Sun, 14 Dec 2025 05:17:42 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4af065sm50301095e9.6.2025.12.14.05.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 05:17:42 -0800 (PST)
Date: Sun, 14 Dec 2025 13:17:40 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Crt Mori <cmo@melexis.com>, Richard Genoud
 <richard.genoud@bootlin.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Luo Jie <quic_luoj@quicinc.com>, Peter
 Zijlstra <peterz@infradead.org>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Mika
 Westerberg <mika.westerberg@linux.intel.com>, Andreas Noever
 <andreas.noever@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 11/16] bitfield: Common up validation of the mask
 parameter
Message-ID: <20251214131740.40063fd7@pumpkin>
In-Reply-To: <202512141305.J3aPiiBv-lkp@intel.com>
References: <20251212193721.740055-12-david.laight.linux@gmail.com>
	<202512141305.J3aPiiBv-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 14 Dec 2025 14:19:30 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.19-rc1 next-20251212]
> [cannot apply to westeri-thunderbolt/next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/david-laight-linux-gmail-com/nfp-Call-FIELD_PREP-in-NFP_ETH_SET_BIT_CONFIG-wrapper/20251213-040625
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20251212193721.740055-12-david.laight.linux%40gmail.com
> patch subject: [PATCH v2 11/16] bitfield: Common up validation of the mask parameter
> config: i386-randconfig-053-20251213 (https://download.01.org/0day-ci/archive/20251214/202512141305.J3aPiiBv-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141305.J3aPiiBv-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512141305.J3aPiiBv-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/gpu/drm/xe/xe_guc.c:639:19: error: converting the result of '<<' to a boolean always evaluates to true [-Werror,-Wtautological-constant-compare]  
>      639 |                 klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_EXT_CAT_ERR_TYPE);
>          |                                 ^
>    drivers/gpu/drm/xe/xe_guc_klv_helpers.h:62:2: note: expanded from macro 'PREP_GUC_KLV_TAG'
>       62 |         PREP_GUC_KLV_CONST(MAKE_GUC_KLV_KEY(TAG), MAKE_GUC_KLV_LEN(TAG))
>          |         ^
>    drivers/gpu/drm/xe/xe_guc_klv_helpers.h:38:20: note: expanded from macro 'PREP_GUC_KLV_CONST'
>       38 |         (FIELD_PREP_CONST(GUC_KLV_0_KEY, (key)) | \
>          |                           ^
>    drivers/gpu/drm/xe/abi/guc_klvs_abi.h:36:35: note: expanded from macro 'GUC_KLV_0_KEY'
>       36 | #define GUC_KLV_0_KEY                           (0xffffu << 16)
>          |                                                          ^

I've just sent a patch to move that warning to W=2.
It is picking up the same sort of things that -Wtype-limits does - already in W=2.

	David


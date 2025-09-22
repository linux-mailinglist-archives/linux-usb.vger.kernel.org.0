Return-Path: <linux-usb+bounces-28459-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E77B8F731
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 10:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C71A618A050A
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 08:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4916285065;
	Mon, 22 Sep 2025 08:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TykEoA+T"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6030527AC3C
	for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 08:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758528979; cv=none; b=NfDd8RXn9QzLbyCqkDmFl6UUkevueXrHvQ2EK1aDwAKlP03+8t+kSdNDZa/W0K/WYigm8bX3Jd7W2exF9P+82248tikCHQLqx4Hqh/btEhfsSJc/udXjx5SpZsVK0YiLmA1LHUWe05716itFRpjlKZ9PICUyRqbbD1z0I+Bq0dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758528979; c=relaxed/simple;
	bh=UMJWZiC7sBj6mxojXhTJC+tuD8oKXX6T1jbAHxgYnJc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TIp6rAHc2eGkJCHXrSySZ/XXX/tAVzETxrxaFBVLVV4JTN9eHmGui8BBengTMKckyw1KKqa97TNgtJOQEMDMQL0T5sTQHRYiIR9v4UK8CS83DvTDdCCI6iUx8JxD/v7zRWNd9N85TvmRQP1Yr6SoMC/tSP0Yn8eT1jXJ5JB1PT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TykEoA+T; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57bd482dfd2so1656835e87.2
        for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 01:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758528975; x=1759133775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5VEvi4x8chbxAda+lSO8rMAf/beZcw/I4cFoExnq3E=;
        b=TykEoA+T2QQDbvhjRHvga/ygUfeJuvwoaRYSR0tBITiSAPBRZCQnO2j8b79UDqd8qR
         6ithQFSgVi544ea4Tace/Ryxtk9Li2oEzQQbPV/ASNj/k7+CwxzYMzPWmWefzU8vOC+5
         YhAdSYPjXlQHSiBHMOAb2h67mO0C5j5ayJBJ99NZdm/xY97XnAW2gLGfgmRUyzCL1qFw
         5RUTihSJUdrxkGmeeuaXKH+AM5VgffaDuQ1Td9yX/ktGPjznBCLC9Qb2IiF3mDJzKvfY
         0/bsXE5Eff+NoKDfpmPEMvXzCMQe03OrAz4TGbkJnaRFE8EHnUQoc/en8ywH8PmC7+6R
         C/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758528975; x=1759133775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5VEvi4x8chbxAda+lSO8rMAf/beZcw/I4cFoExnq3E=;
        b=S9dxPdR3xl8EB2F01HmBMR/7o8QWN/ZDaturAoRyw9yoxvp6ZRZW0Bb5wgfasNODAf
         ExHxSYopqIPcy3zws4+vkuyBPuvbBdb5P+mhYistXoakaYjnPjhm4FBHUM/Hc8/ADAW8
         dv3atd5Ju4NpM6nFWLT8V1wl0TvgJu8ki0RP1CkmZFDpAtMSBasXAxtn+yIdm0ajAzNb
         47+dNTZFyA0atsL0qGlw1QjXwkaKF/jKC+31zzJN0WZvbNcaQFjg1xyJD+WGDLtAtXpI
         NWiLBCDv78aHUDdErnfDlevowbZ+D0MzQIpALfdE4RoFcCnCGSZuAYuNx272mIV1jfWc
         9umA==
X-Gm-Message-State: AOJu0Yzj7+iC/b1chdR6owuq9Vxd8HCDuN7Mr68IHWM/s9HxFPH3VcQj
	TYnydO4PbEwnb36djZ4kX38p7urulyYvuvGRonRmHQHJzNmTq2OPOM4+
X-Gm-Gg: ASbGncstkK9THyF315hcHAKvLiMTfokb6Jw6x2Ak3XqHuKaBV3r11fhzYsQ3O91wmzo
	n7AiCmx7P34ROd66TBWoZwBIMBotlC22XrGhWJohUYiVz0WqicOLFDwE4tcHMVBz8uRKy321lyg
	Q5NVnOARNs1t39Kw/seZ/plxJUf6H21gKuRNvcl7spQKMml5GkvUnnQdlMu8aCyvw10+dXoRDlh
	7kYaluJwbTj7AYzo1DsFupdfVpHB8US89FRESoPNd6OU41Jj6p1YNfm5v+k91dex2sLRsfyJw+g
	8cMybl4oQa8x1xOt/5lnfCk5C2p01vv0sH17S0IRbeLH6Vn0qqYmQpKFlE89os6FKrFdakfbW6C
	a0Y9NIAbM8nx3S366hhflwTnccPEyDlt2kIM=
X-Google-Smtp-Source: AGHT+IEBnciOJYeoELu8rLKOpYmJe14ZWR4sLAktR1bK9CrTwUMc1Hawjx43GGZQU5SZBI4fWanYFg==
X-Received: by 2002:a05:6512:4041:b0:55f:4fac:3f2b with SMTP id 2adb3069b0e04-579dfccb059mr3293297e87.5.1758528975194;
        Mon, 22 Sep 2025 01:16:15 -0700 (PDT)
Received: from foxbook (bfe191.neoplus.adsl.tpnet.pl. [83.28.42.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57e37d09511sm868935e87.88.2025.09.22.01.16.13
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 22 Sep 2025 01:16:14 -0700 (PDT)
Date: Mon, 22 Sep 2025 10:16:10 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] usb: xhci: Queue URB_ZERO_PACKET as one TD
Message-ID: <20250922101610.0102e1a1.michal.pecio@gmail.com>
In-Reply-To: <e29fa12b-55e4-4ab1-b623-11feb447bdf7@linux.intel.com>
References: <20250908130128.7ed81912.michal.pecio@gmail.com>
	<6ca18b05-80d4-4988-bb08-3cad003e10f4@linux.intel.com>
	<20250909193859.73127f85.michal.pecio@gmail.com>
	<e29fa12b-55e4-4ab1-b623-11feb447bdf7@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 Sep 2025 01:57:39 +0300, Mathias Nyman wrote:
> On 9.9.2025 20.38, Michal Pecio wrote:
> > But this is not what this patch is about - the trick is to use an
> > *unchained* TRB, which is a separate TD from HW's perspective, and
> > to count it as part of the same TD from the driver's perspective.  
> 
> Ok, I see.
> The whole TD without completion flag does worry me a bit.
> 
> We need to make sure stop/stald mid TD cases work, and  urb length is
> set correctly.

I came up with a potential problem case for clearing IOC:

1. all data of the first TD are sent out sucessfully
2. no completion is generated because no IOC
3. ring stops before advancing to the zero-length TD
4. we only get FSE (Stopped - Length Invalid)

See xHCI 4.6.9:
     Table 4-2: Stop Endpoint Command TRB Handling
       2nd row: Stopped on TD boundary

Current event handler doesn't expect this to happen and actual length
will be reported incorrectly. This would be easy to fix.

But there is also the 0.96 spec where FSE was optional (xHCI G.2), so
on some HCs (like NEC uPD720200) we won't get any event whatsoever and
the almost fully completed URB will seem to have transferred no data.

(This assumes that any HC would stop in this manner rather than advance
to the zero-length TD atomically after previous TD completion and stop
normally in the zero-length TD. So not sure if it's a real problem and
the condition seems hard to trigger for testing purposes.)


Control URBs have the same problem - FSE isn't handled very well and
old HCs would seem to need IOC on the data stage to ensure correct
actual length of cancelled URBs, if anyone cares.

Regards,
Michal


Return-Path: <linux-usb+bounces-23074-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F22A89990
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 12:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FBC77A1D19
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 10:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06231F3BA6;
	Tue, 15 Apr 2025 10:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="krrS1WSx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9D41991B2
	for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 10:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744711904; cv=none; b=NKLDYGLT3Ewk6qUBhhanImy8lVFKq6K+Hv8MAZ6TX+sN6/lZZL0FydJct25URsVYLTtQ/fooiFo8g1JRPiHbAUMORDTcwI9m9umJfBumvvGOLV/5dC6ZUkJp46wC5NxQffJD0WOr3Oxb7vV3dudkTDCjVHipbTnyYXY5GEy9I3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744711904; c=relaxed/simple;
	bh=pad2z7btKusTAdrgNujXvQaY6iYVQDbHAihtkip7dI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MtISerokecxHRjWZ/Z/I0qbygvW8F/RQsczdGC6n+a9dw+DI1x2wpssU+qtAvKVkvZgjkLmlesNlDoG/xBV4/xHwt8/dsHUdczAl3mNuvNDZTFIk1hd0egrFgSvPZkucI1nD51ym4nz0QUCdYKuXgqkfhzd7LFeDCsTxkgQl/ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=krrS1WSx; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so4691816f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 03:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744711901; x=1745316701; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RuHw2+9Bddg4/t0C51DxWKmelYmbDY+X4yG4DeXkJ0g=;
        b=krrS1WSxpD5di1/Gzp1suE8mPU96EnqSt0ZzG8si36DGm12iJRpgiPl+IyL8K92YzG
         4qv1vgUnob/stBPuhNTJtg8YfU32fuvD3D3WmKi/t/WNwL0sljs9bWqWTjxVlGg39Swb
         Vw8YIqTQnt0nEqCTZSPc3nh2WASV3e2OREBrjK9lVaJt9sTZS58I7TOg0TOT3m8fi+IU
         E/flE+rBX2XOKHCWtQjpzz71coU7gNcD5tmR6KWiMH04YZ6TNk0+e0gHdOYJcMzelgmC
         xmgBJhpuAwGf6DzU0PeUyeNTy8wBF7z9qLxXPKy3DPiiA985d/zXV7yvplsoZVAM/9A9
         YqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744711901; x=1745316701;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RuHw2+9Bddg4/t0C51DxWKmelYmbDY+X4yG4DeXkJ0g=;
        b=kmNwfePKeXvN1mRMFTqo61QNSiXJlT2v8L1DnDyDOqXjWFNGfE9ya+GHdliwPCY4N1
         QNHv8TitOZHC3lAzAHzcbHWEy22dnB4QaWS9iJI5m9QmiiZN73t86GU7+gwSBkpolQOr
         qGnufa9SpkDsffX5hDMs7fOQKnfj9CxzadvEN7kVR/uhv9kLWS9NuytGa8TsRBTZyK3p
         4xl7xZ/B/4SxXZ+0fuwpTYxNHa+J4ghYKqpMphpeZ8K/i8RfuqXg/OMNvM0NvPK2AMF5
         TVt7gyrPMjNMztAxD9Yrhy8CFiO+jtrXaSah3O/LyqrvtPMhnIZ2HPA04HkKCMouxyMY
         9yYA==
X-Gm-Message-State: AOJu0Yxvq2hHs9ge1On/n8Cgmc9yDr2V6blVHU4vrVNJDhivcmnYYFwH
	L5Ya2L5wcXhrClLIsDIJWjaaD/MOiyKZd7KS50kn8hm+Yaec3HRcE2CWjQw6RrE=
X-Gm-Gg: ASbGncuJrqYiJfw6lLGiWLu9R4PuVQ1q3tk+uaX8rvhJX62ZDnDdC16ih8AkWrv0NTC
	d1QNCZt8cBjq0dNaeX96yVDgDINyCZTPX+04rpaiRXPtnIF3eqTVrboMstoivCISaZ7I9HID8PC
	6Q8B4/nB5bODAuHpHc78XMU4dVfQicJQ9sx7ttaq5QUgAXk+dSGDMAjdis8J2QOjGqudBfjgMQB
	eMSTqKvJoGsiCd/3FQoloYJv6Da+idadJl/d6bWNAF25efbP9BUwTENeNJ0fUOXk2pXfhKiYGvj
	wBWP+MBLeFa9JLjF6T/eeainjaqyMSaTeBAp3AVnjLgk4g==
X-Google-Smtp-Source: AGHT+IHJmDPwovU17Z0TxO1zn1e+r1S2RndQbaXLalI05AvJ6dS0GjAJxCwXQXH5imnKjDTV2Q3j7Q==
X-Received: by 2002:a05:6000:1848:b0:39c:13f5:dba0 with SMTP id ffacd0b85a97d-39ea52019f0mr13630616f8f.13.1744711900703;
        Tue, 15 Apr 2025 03:11:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae96400dsm13919525f8f.11.2025.04.15.03.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:11:40 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:11:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-usb@vger.kernel.org
Subject: [bug report] usb: host: xhci-mem: Allow for interrupter clients to
 choose specific index
Message-ID: <Z_4w2b0BMiaCHqUx@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Wesley Cheng,

Commit fce57295497d ("usb: host: xhci-mem: Allow for interrupter
clients to choose specific index") from Apr 9, 2025 (linux-next),
leads to the following Smatch static checker warning:

	drivers/usb/host/xhci-mem.c:2373 xhci_create_secondary_interrupter()
	error: uninitialized symbol 'i'.

drivers/usb/host/xhci-mem.c
  2333  xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
  2334                                    u32 imod_interval, unsigned int intr_num)
  2335  {
  2336          struct xhci_hcd *xhci = hcd_to_xhci(hcd);
  2337          struct xhci_interrupter *ir;
  2338          unsigned int i;
  2339          int err = -ENOSPC;
  2340  
  2341          if (!xhci->interrupters || xhci->max_interrupters <= 1 ||
  2342              intr_num >= xhci->max_interrupters)
  2343                  return NULL;
  2344  
  2345          ir = xhci_alloc_interrupter(xhci, segs, GFP_KERNEL);
  2346          if (!ir)
  2347                  return NULL;
  2348  
  2349          spin_lock_irq(&xhci->lock);
  2350          if (!intr_num) {
  2351                  /* Find available secondary interrupter, interrupter 0 is reserved for primary */
  2352                  for (i = 1; i < xhci->max_interrupters; i++) {
  2353                          if (!xhci->interrupters[i]) {
  2354                                  err = xhci_add_interrupter(xhci, ir, i);
  2355                                  break;
  2356                          }
  2357                  }
  2358          } else {
  2359                  if (!xhci->interrupters[intr_num])
  2360                          err = xhci_add_interrupter(xhci, ir, intr_num);

i not initialized on this path

  2361          }
  2362          spin_unlock_irq(&xhci->lock);
  2363  
  2364          if (err) {
  2365                  xhci_warn(xhci, "Failed to add secondary interrupter, max interrupters %d\n",
  2366                            xhci->max_interrupters);
  2367                  xhci_free_interrupter(xhci, ir);
  2368                  return NULL;
  2369          }
  2370  
  2371          err = xhci_set_interrupter_moderation(ir, imod_interval);
  2372          if (err)
  2373                  xhci_warn(xhci, "Failed to set interrupter %d moderation to %uns\n",
  2374                            i, imod_interval);
                                  ^

  2375  
  2376          xhci_dbg(xhci, "Add secondary interrupter %d, max interrupters %d\n",
  2377                   ir->intr_num, xhci->max_interrupters);
  2378  
  2379          return ir;
  2380  }

regards,
dan carpenter


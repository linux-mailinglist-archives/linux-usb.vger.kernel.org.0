Return-Path: <linux-usb+bounces-29065-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8C4BC72C8
	for <lists+linux-usb@lfdr.de>; Thu, 09 Oct 2025 04:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD7993E776A
	for <lists+linux-usb@lfdr.de>; Thu,  9 Oct 2025 02:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55101891AB;
	Thu,  9 Oct 2025 02:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="jLAPxLFh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1BE1397
	for <linux-usb@vger.kernel.org>; Thu,  9 Oct 2025 02:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759975427; cv=none; b=GHdQUXtc7Y4dmIDL+EJl5e7lhYRPUwTQE9IMo6I7+i7SQbHKxnNWCJbO8WRaYpiSaSqprU6GSIWyj+uLaOYHOHpWYhBGb3Z+xOOCjV2qgqkYLb+JIsW64JZ/P+AQPJLTxocdCRMY2UFSfy19+OmykcFemTZakqBnSv6/M5CsihE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759975427; c=relaxed/simple;
	bh=MU4gbTfLLIXkWCmWpKbS3JVTa0y9M3Q9BfcDXADHJXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWOmumw/m8ODOBW0fHz9yCInAGvRYiEUW0/0vW2UUTWnGiJCzdjOY7QAwLJuj0GvdLrUTDBs8hvCTOGZcbaPYfzBwbKZoX3tu5NeZf3ojU4nnFymD7HQB08Qk2+dLmyzQFnteta077Me6rYP5B4dpBp/WJSx7lra7XiXPz/abTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=jLAPxLFh; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0350B3F5B1
	for <linux-usb@vger.kernel.org>; Thu,  9 Oct 2025 01:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1759975113;
	bh=FUSIhn952fhTN3vmzJuLfSjHS7O8TS53RpYKH1XPQ1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=jLAPxLFhzEDCOatuKnDgOBkjMasCwoYbghMULlt5rUb/eVJMHkkw/A0fHurlp8pHB
	 vTLJEK8XytagC1nF7t6/BI4WC4jC/vY02MwHgRAXpMzzDoS31XY9q+4vLhS5FcJZat
	 CbZb/MziE/gMykJyDaQrbMPra18yuLzSjs2bIQO5zem4ahfMhMc4BcDr7zJCDBg43K
	 BZDkeUJQvvpJKMUnUgMbkJJL2iDBH0NWBKQB/8uahlcc23mTr32lcCc5xkkerGFy3f
	 IVvq5mTPOcOspsmcK3yDgvJFNlsv0lisZjG/UnB3hbis3jYPrRIVPdJclSyR0DrNhC
	 8NjzsP0OvCnjVUshCsG2NllY3atysGyy6WFTJtrsg0JpBvIrrq9lzQEnk/3GRZVUhu
	 ovPuWtq8JVOJRwbiBEN6x6kTPYUYjUQQBzUKeVMrfCE3Tuxs8wfyFb+8KFILWXceu1
	 JXap4vsaBPDk8HW8Hsu9GV67DgaBpm7BTEiv7HX21OtdW/XvU9DW6eIa/IeiVko9t4
	 HDH5dYq4wj1G4jH6DdMupjP5PxfTmd5Wak6nPQNy1MXM25QAsXwbL/Assp2y58cBkZ
	 gdMqiuQE7M5Z9w5SaxbkgjEHsc1Hwq9XVOaZKRtGr2LHqD7DJ6nSHo3mJIGnPGhaRt
	 OoB2BmzA22uH7nplv48lLu+A=
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8635d475556so90812185a.0
        for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 18:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759975112; x=1760579912;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FUSIhn952fhTN3vmzJuLfSjHS7O8TS53RpYKH1XPQ1Q=;
        b=nPej62IIM9mkw4grFq1jx77l9n1BbYB4DbOxH6vc+1s/wkA1nFLNya6VOkXy4M3FN4
         QD42vs1BmznLq8+De3WfKOlNJ9eo/Y0L+ojl51G3MGOTwpeSX6FO71t5Pa3grgLz3Dvr
         xyXP3D5FeIujwijoLmX3mnGxigHeWChE8nid9+jhiJ/JqBWxWKvhQS5Q4+H1QBYpCxq/
         pjOnQEAVgq1u4boNPIXgq8sTGb0/ujy1stZWv4ET+KHbOVMf3C+5oofk06pmhQ+OJkmu
         NkzIamOCMTfBDk/wgBlOJC6eFHwxSoipYrP8ytLQYX4wAH9AyF5z0DFJY4fsoGGboGEv
         svTA==
X-Forwarded-Encrypted: i=1; AJvYcCV2ZKxR7R1FQ03uKVJBX24MCZEQu0aNMwSUsS5HToGVqnPTMPhUTfiQTOc2GRofWD3DNmY2hLjGQsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIbJ2GF+zCbALFFznE3vt5gmsyxZLZL3KdMASZCwP4B2+CbWAB
	OOoPYlRVz/XnqhyEjnv1yihj9GNYW+chtDx/3j2lt4FQk4v2MyJnc2W6FI1sj3Lqd+SqoTj9ud2
	nyWPxmG2FE/PSAdh9D5G4S7jcCoaPo1ZXzqirWEsA0McVq+ZaTC3vFaerkL5F3yPaRiL43tHYnh
	7wJw==
X-Gm-Gg: ASbGnctuHbGptd5683j+dVmRbAydpFq5rMipVq8pHQmLt/SzpIWMrAWIneV9QaRrlXJ
	S/cse0fiGO83IKsiykBEfMrq2ulPPpRRlRD3g/XBK4NKVZ1IZ0DlNRkueXqaN9s7ExAGaaGnDtX
	7vK9Ks31tlbVzw9W4ZbLaomP2lV8mkXQ2qZ6ncK0ZgyOTMla//OroZOCtsh2mFml5GsMQ/FWrTD
	cM0ek2ph6AV5DcULEkapaZaQ5CNIEnEk+egAixOG5WSz8q5g7tiV1eae2VTQEnFRI25236zit6v
	X2ypVlcYYkzKxBc1lhI6Gak8XjJQiNGJbyChk0MKolyK4ylgG1ezJw==
X-Received: by 2002:a05:620a:40c8:b0:829:d46:78f5 with SMTP id af79cd13be357-883550968a1mr906844585a.37.1759975111824;
        Wed, 08 Oct 2025 18:58:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnPPJVNu3RN5ki3DKYl679MCXogvom6CHeBzt3SVlr1CEVHUrCc9R4VSP/nuulCXhy5KwzIA==
X-Received: by 2002:a05:620a:40c8:b0:829:d46:78f5 with SMTP id af79cd13be357-883550968a1mr906842685a.37.1759975111277;
        Wed, 08 Oct 2025 18:58:31 -0700 (PDT)
Received: from acelan-precision5470 ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55a34b607sm175173841cf.4.2025.10.08.18.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 18:58:29 -0700 (PDT)
Date: Thu, 9 Oct 2025 09:58:22 +0800
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Andrei Kuchynski <akuchynski@chromium.org>, 
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>, Venkat Jayaraman <venkat.jayaraman@intel.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Fix workqueue destruction race during
 connector cleanup
Message-ID: <dr5dderec7diwlsiu7n5vziotw4lnnkletyy7hb55miosrdiy7@oy3nqplgcv6s>
Mail-Followup-To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Andrei Kuchynski <akuchynski@chromium.org>, 
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>, Venkat Jayaraman <venkat.jayaraman@intel.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251002013026.4095030-1-acelan.kao@canonical.com>
 <aOY-OyN90DScHr85@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOY-OyN90DScHr85@kuha.fi.intel.com>

On Wed, Oct 08, 2025 at 01:34:35PM +0300, Heikki Krogerus wrote:
> On Thu, Oct 02, 2025 at 09:30:26AM +0800, Chia-Lin Kao (AceLan) wrote:
> > During UCSI initialization and operation, there is a race condition where
> > delayed work items can be scheduled but attempt to queue work after the
> > workqueue has been destroyed. This occurs in multiple code paths.
> > 
> > The race occurs when:
> > 1. ucsi_partner_task() or ucsi_poll_worker() schedule delayed work
> > 2. Connector cleanup paths call destroy_workqueue()
> > 3. Previously scheduled delayed work timers fire after destruction
> > 4. This triggers warnings and crashes in __queue_work()
> 
> What warnings?
Here is what I got.

Sep 24 13:24:22 ubuntu kernel: sysfs: cannot create duplicate filename '/devices/platform/USBC000:00/typec/port0/port0.0/partner'
Sep 24 13:24:22 ubuntu kernel: CPU: 1 UID: 0 PID: 132 Comm: kworker/u64:1 Tainted: G           O       6.14.0-1012-oem #12-Ubuntu
Sep 24 13:24:22 ubuntu kernel: Tainted: [O]=OOT_MODULE
Sep 24 13:24:22 ubuntu kernel: Hardware name: Dell Inc. Dell /, BIOS XXXX XX/XX/2025
Sep 24 13:24:22 ubuntu kernel: Workqueue: USBC000:00-con1 ucsi_poll_worker [typec_ucsi]
Sep 24 13:24:22 ubuntu kernel: Call Trace:
Sep 24 13:24:22 ubuntu kernel:  <TASK>
Sep 24 13:24:22 ubuntu kernel:  dump_stack_lvl+0x76/0xa0
Sep 24 13:24:22 ubuntu kernel:  dump_stack+0x10/0x20
Sep 24 13:24:22 ubuntu kernel:  sysfs_warn_dup+0x8a/0xb0
Sep 24 13:24:22 ubuntu kernel:  sysfs_do_create_link_sd+0xf1/0x100
Sep 24 13:24:22 ubuntu kernel:  sysfs_create_link+0x21/0x50
Sep 24 13:24:22 ubuntu kernel:  typec_probe+0x7e/0x100 [typec]
Sep 24 13:24:22 ubuntu kernel:  ? driver_sysfs_add+0x66/0xd0
Sep 24 13:24:22 ubuntu kernel:  really_probe+0xee/0x3c0
Sep 24 13:24:22 ubuntu kernel:  __driver_probe_device+0x8c/0x180
Sep 24 13:24:22 ubuntu kernel:  driver_probe_device+0x24/0xd0
Sep 24 13:24:22 ubuntu kernel:  __device_attach_driver+0xcd/0x170
Sep 24 13:24:22 ubuntu kernel:  ? _pfx__device_attach_driver+0x10/0x10
Sep 24 13:24:22 ubuntu kernel:  bus_for_each_drv+0x94/0xf0
Sep 24 13:24:22 ubuntu kernel:  __device_attach+0xb6/0x1d0
Sep 24 13:24:22 ubuntu kernel:  device_initial_probe+0x13/0x20
Sep 24 13:24:22 ubuntu kernel:  bus_probe_device+0x9f/0xb0
Sep 24 13:24:22 ubuntu kernel:  device_add+0x513/0x710
Sep 24 13:24:22 ubuntu kernel:  device_register+0x1a/0x30
Sep 24 13:24:22 ubuntu kernel:  typec_register_altmode+0x253/0x3a0 [typec]
Sep 24 13:24:22 ubuntu kernel:  typec_partner_register_altmode+0xe/0x20 [typec]
Sep 24 13:24:22 ubuntu kernel:  ucsi_register_altmode.constprop.0+0x30e/0x390 [typec_ucsi]
Sep 24 13:24:22 ubuntu kernel:  ucsi_register_altmodes+0x162/0x250 [typec_ucsi]
Sep 24 13:24:22 ubuntu kernel:  ucsi_check_altmodes+0x19/0xb0 [typec_ucsi]
Sep 24 13:24:22 ubuntu kernel:  ucsi_poll_worker+0x3d/0xf0 [typec_ucsi]
Sep 24 13:24:22 ubuntu kernel:  process_one_work+0x178/0x3d0
Sep 24 13:24:22 ubuntu kernel:  worker_thread+0x2de/0x410
Sep 24 13:24:22 ubuntu kernel:  ? __pfx_worker_thread+0x10/0x10
Sep 24 13:24:22 ubuntu kernel:  kthread+0xfb/0x230
Sep 24 13:24:22 ubuntu kernel:  ? __pfx_kthread+0x10/0x10
Sep 24 13:24:22 ubuntu kernel:  ret_from_fork+0x44/0x70
Sep 24 13:24:22 ubuntu kernel:  ? __pfx_kthread+0x10/0x10
Sep 24 13:24:22 ubuntu kernel:  ret_from_fork_asm+0x1a/0x30
Sep 24 13:24:22 ubuntu kernel:  </TASK>
Sep 24 13:24:22 ubuntu kernel: typec-thunderbolt port0-partner.1: failed to create symlinks
Sep 24 13:24:22 ubuntu kernel: typec-thunderbolt port0-partner.1: probe with driver typec-thunderbolt failed with error -17
> 
> -- 
> heikki


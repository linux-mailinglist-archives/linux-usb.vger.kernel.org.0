Return-Path: <linux-usb+bounces-1284-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8233B7BE802
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 19:30:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38CEA281CA7
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 17:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77CD38BD9;
	Mon,  9 Oct 2023 17:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="grFtVCa9"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEA238BD3
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 17:30:40 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C9B1127
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 10:30:37 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2bff776fe0bso61048581fa.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Oct 2023 10:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1696872635; x=1697477435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHSd56ONGtiYc/4iRkmyqmxuAngFJzU7FR00LimB0+s=;
        b=grFtVCa9AE5vZnIqHY2K2bNP8Z6TwHUlqSnlQynYLfm5yY9bfW+Udn2tegWIbDpqZV
         eIy68gqJd/Ry9v9XmIvfaKaBKzf/fJAMUDootzAKML2FCQG9tgQHF0skd2fI8KSZj4Zj
         5laR0MFZ2upzjp7XVdBB/uX+wUaNSql2ew7bKicL1rvMh4AiP1yQa7jS/aHH4SPCv+h7
         mJmiRaOLnWW7Fevap8tTGkZJxbnV/PQaBzkPAQA5vis85tB6Wt4vnGuO2FY3G3WXWPPQ
         5TGZ66RGIVBojnHk2wmoPN+YgNuIJfFDQYYSHN5NHspuLbK0Eb2LJ9kod7O3tg0yOsLb
         o0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696872635; x=1697477435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHSd56ONGtiYc/4iRkmyqmxuAngFJzU7FR00LimB0+s=;
        b=UkhAoZEQ+2GcDyonP4AenFC7mXWNSIIi+9Oaa/MKjZ+V755z8l9wGlHxj2NTHCOQN/
         Nxla8MB8r22MFsG9IAcKG+5AFjRQ0ttgxgfEpk4KQ3jz4SqUzeE0+taE8H3VC9wlslCw
         jpShCgHirdSAkAXlARlL3CfefzuqYbe+IKwq6+S5HKlIIQd68WhdJH+90S9xjrbb7aU2
         wlwZ1Ez16DswBnpy7ZaszLa2Q5S1FALuoUDPXKWxn+Jp0DUIyjs1YO2EK2GnUbPAw5TK
         cQU47G3zYW1EshJD3pCxjaupyHGFKVp381ZZEmUVaPzNneVAjnQVHRHQPxcfxtZF/1lC
         RJfA==
X-Gm-Message-State: AOJu0YzdM9WgI2Xhw6a9vrWIX0OKy64PLnSV/IEKIsgl3ovjIQYiOVYH
	Wr04zs4fNNhwrOjsx3bOhbpdv1H/lj4gihKeyIdgAA==
X-Google-Smtp-Source: AGHT+IHBRA959tJKQ7jnBDww7hLjflOoCbxbxU4OC4L9uyovk7KidWNus9mZc9b5/3C/KVDAr0hL4Kjy/lMZJqv9EF4=
X-Received: by 2002:a2e:86d6:0:b0:2c2:9e5c:2c82 with SMTP id
 n22-20020a2e86d6000000b002c29e5c2c82mr13644840ljj.46.1696872635192; Mon, 09
 Oct 2023 10:30:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009165741.746184-1-max.kellermann@ionos.com>
 <20231009165741.746184-6-max.kellermann@ionos.com> <2023100921-that-jasmine-2240@gregkh>
In-Reply-To: <2023100921-that-jasmine-2240@gregkh>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 9 Oct 2023 19:30:24 +0200
Message-ID: <CAKPOu+8Tb2CopWgBN29hmJrmU9mjG63PyVoaewuY0FYj=aGTZA@mail.gmail.com>
Subject: Re: [PATCH 6/7] fs/sysfs/group: make attribute_group pointers const
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jens Axboe <axboe@kernel.dk>, "Rafael J. Wysocki" <rafael@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Richter <rric@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
	Bart Van Assche <bvanassche@acm.org>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Dan Williams <dan.j.williams@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Alessandro Zummo <a.zummo@towertech.it>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@arm.com>, Leo Yan <leo.yan@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Pavel Machek <pavel@ucw.cz>, 
	Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Sebastian Reichel <sre@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rdma@vger.kernel.org, iommu@lists.linux.dev, nvdimm@lists.linux.dev, 
	linux-nvme@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-serial@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 9, 2023 at 7:26=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> I'm all for doing this type of work, but this is going to be rough.  You
> sent patch 6/7 that hit almost all subsystems at once :(

I wasn't sure whether splitting patches was desired. In the past, I
was often asked to fold multiple patches into one. There are so many
opinions :-) but I'll gladly change to whatever is asked.

> "*const*groups"?   That's a parsing nightmare, really hard for humans to
> read and understand.  Doesn't checkpatch complain about this?

No. I'll change the coding style (and maybe take some time to fix checkpatc=
h?)


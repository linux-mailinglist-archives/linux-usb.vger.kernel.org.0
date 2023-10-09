Return-Path: <linux-usb+bounces-1306-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F9C7BEB3E
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 22:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 223821C20C88
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 20:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24BB3D986;
	Mon,  9 Oct 2023 20:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="BFuMz3FM"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B623D993
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 20:06:11 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F74E3
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 13:06:08 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c1807f3400so60244961fa.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Oct 2023 13:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1696881966; x=1697486766; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vntWR/EJpWFamZ/9NMXVbCLlV4xDhJbERcnlqbMN6Xk=;
        b=BFuMz3FMbhLgkIJi/HkkmJ1VkLf2I7vqp4svyIwG2+yDE+U4S96EGEikgUcb8O02Uo
         8j8iLlfo7vmxsfcwVcs/qIKkl99xa5dmEeJRo1cSF6V+ygbEal7iO3+v912NQA+dawBz
         Soy5yco9XA4Rbc4rDCwVGkioAfXZalXRitmVvyF0C2rWZ0Ewe2//XA3FBEsbn52apGZL
         aRFt/c7Wzbg6QpYPQ0dm8EJR8fe2x3S+duZuFSIP/H5VlRW/FVRYn5HxOETlTJKz3xcb
         BMDmJLPjWEXQ8IaDm9bc5q/71Ibv+h4ffhs1BXiaAk1KUwUk/S2rUW6zLyroy1Lm1kJC
         OAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696881966; x=1697486766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vntWR/EJpWFamZ/9NMXVbCLlV4xDhJbERcnlqbMN6Xk=;
        b=B285GgYLJ8GEQPCo8eeTO+v+i4VrWV19tEC3kYUTqMCxcAk2bcH8c8NaxR4eqlr30U
         Ou5w8N2a7AsGUjH9wpNJkatxQdAdrfnOb+QWvwC+TKT8bSUUbvLLVjUTVVC6xPl0fMwW
         FoNYmVQFgpxat0CckqXYfpqrLat7YauIJ6b++qpf6ymI5nHxuWWZR1xs83Xex2WjtCv+
         BbgLx5+Pyp7OzTZgwE25M976bOHsOVHsRH5vAj4lUqC4gdc9hVoOUiLGkPdz9p9wIpFw
         z/gjervCSnpTW6uCEYH26kXlUJ78YxIH3oeaNQKRZRvphCvJxvvsLUGbA3QD/4wfXkYw
         9IgQ==
X-Gm-Message-State: AOJu0YxMjOjj1ezCzN7cDJ8klobd129pPjQ910sUEHLnQs+7+qpxq5Bs
	o+Ouerz/iCRavwbxjHAwVw07OeKYPPDeYFW/iStlVg==
X-Google-Smtp-Source: AGHT+IFghqg7b3VfDVvZ+soPEwEaIfxhrwarlOcz2b03PC3KagC0O9BH1UGRNCP79pJ8yT5JMzxC/VoYSKvtKG/y1ws=
X-Received: by 2002:a2e:870c:0:b0:2b6:cbdb:790c with SMTP id
 m12-20020a2e870c000000b002b6cbdb790cmr11535962lji.1.1696881966432; Mon, 09
 Oct 2023 13:06:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009165741.746184-1-max.kellermann@ionos.com>
 <20231009165741.746184-6-max.kellermann@ionos.com> <264fa39d-aed6-4a54-a085-107997078f8d@roeck-us.net>
In-Reply-To: <264fa39d-aed6-4a54-a085-107997078f8d@roeck-us.net>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 9 Oct 2023 22:05:55 +0200
Message-ID: <CAKPOu+8k2x1CucWSzoouts0AfMJk+srJXWWf3iWVOeY+fWkOpQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] fs/sysfs/group: make attribute_group pointers const
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jens Axboe <axboe@kernel.dk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	James Morse <james.morse@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Robert Richter <rric@kernel.org>, Jean Delvare <jdelvare@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Bart Van Assche <bvanassche@acm.org>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Dan Williams <dan.j.williams@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jiri Slaby <jirislaby@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, 
	Leo Yan <leo.yan@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 9, 2023 at 7:24=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
> Also, I don't know why checkpatch is happy with all the
>
>         const struct attribute_group *const*groups;
>
> instead of
>
>         const struct attribute_group *const *groups;

I found out that checkpatch has no check for this at all; it does
complain about such lines, but only for local variables. But that
warning is actually a bug, because this is a check for unary
operators: it thinks the asterisk is a dereference operator, not a
pointer declaration, and complains that the unary operator must be
preceded by a space. Thus warnings on local variable are only correct
by coincidence, not by design.

Inside structs or parameters (where my coding style violations can be
found), it's a different context and thus checkpatch doesn't apply the
rules for unary operators.


Return-Path: <linux-usb+bounces-624-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CEB7AFC4C
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 09:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 2C5162821FD
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 07:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95BD1C6BF;
	Wed, 27 Sep 2023 07:47:08 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414C51C2BA;
	Wed, 27 Sep 2023 07:47:07 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 176E6BF;
	Wed, 27 Sep 2023 00:47:06 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-533df112914so7992155a12.0;
        Wed, 27 Sep 2023 00:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695800824; x=1696405624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wumS1C3PQQ5KYgcSNmBkqyM+nn4oC9GlvcQr5Dhuxtc=;
        b=jjRD59SUHioTrUlr69fYdlT34xDMGivOEZaxpHc8rEGEHm2SlerQqSQC6J3BwtdLZy
         kAtTUWjGZkXoleGLT39sGnf1muloz7noIduiq27Y3T5udg4EMCHP7OqyfsQQ84ONnTmV
         MAAFFGglsv3sNVEthrRnUodc2jualN8XZYM2ZhQeXlUxgNWaKlXTt1V1D36npSVkD1Ih
         KGSWiYbKI6qw+9Fzq72mmZ9f1JNZAeiudKbO0X8eLftwXGZ3wooNxGcU5kCmWYMqveO4
         TszYdHOyiCgVbes3UOb4V+QqJCOTM9ukObITm06L1/+uywU2Rj7WZGBaejbo3+3liZhb
         IHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695800824; x=1696405624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wumS1C3PQQ5KYgcSNmBkqyM+nn4oC9GlvcQr5Dhuxtc=;
        b=s2aAaVY+4HmUegnLYUiFKjEiWYq1/Z6ZloF72LhGIX68Mr9sqX1YVjY+mj+71yKFHl
         B286DduznpI2FKxZ6xrIi3X/Q3dnDgqeyOlQd7gZ/3P5TTnL8nNwTeHeQyNbSszBYx1U
         hAfSJFZDsBjEpMDNJuThusjN7zKd6EcVjIZsdk3R1y1OBJC7duEuLQTiWJ8oqzEENuEZ
         1HfnYV472vNSVpIXwborGKyeEuaRQI69T3U7MugElffXDcJFSGpC3m2re3DEi6PhVADt
         7kSTAEPIXwhVBMzLSewduWwBLT5PCoXcUXm79yFyKnhvR/tf8GFZZUf6b+M2uWSYAIMR
         Fgdw==
X-Gm-Message-State: AOJu0Yw9PtBS9PMWIbdW4G/NaJKMpbD8vJIrSrKDVIFxB6TNAsRacfsh
	rQljvc9Kv5gFvnGNX8/OOf4=
X-Google-Smtp-Source: AGHT+IHusU7lhGicPBVuLh3sb4Co896Bmmyzi9Xm4IsELthpKSUab7WBmJMnyROQZ8rQ/Mfm/1zFRA==
X-Received: by 2002:a17:907:c241:b0:9ae:513d:47bd with SMTP id tj1-20020a170907c24100b009ae513d47bdmr990456ejc.26.1695800824350;
        Wed, 27 Sep 2023 00:47:04 -0700 (PDT)
Received: from primary ([212.34.12.50])
        by smtp.gmail.com with ESMTPSA id t16-20020a1709066bd000b009ad8d444be4sm8816176ejs.43.2023.09.27.00.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 00:47:03 -0700 (PDT)
Date: Wed, 27 Sep 2023 03:47:00 -0400
From: Abdel Alkuor <alkuor@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: krzysztof.kozlowski+dt@linaro.org, bryan.odonoghue@linaro.org,
	gregkh@linuxfoundation.org, robh+dt@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, conor+dt@kernel.org,
	ryan.eleceng@gmail.com
Subject: Re: [PATCH v6 02/14] USB: typec: Add cmd timeout and response delay
Message-ID: <ZRPd9IHwBsDOJqJv@primary>
References: <20230923073959.86660-1-alkuor@gmail.com>
 <20230923073959.86660-3-alkuor@gmail.com>
 <ZRPTHeYhdtdtKZ1/@kuha.fi.intel.com>
 <ZRPXLBj/Y6+yiwf8@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRPXLBj/Y6+yiwf8@kuha.fi.intel.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Sep 27, 2023 at 10:18:04AM +0300, Heikki Krogerus wrote:
> On Wed, Sep 27, 2023 at 10:00:50AM +0300, Heikki Krogerus wrote:
> > On Sat, Sep 23, 2023 at 03:39:47AM -0400, Abdel Alkuor wrote:
> > > Some commands in tps25750 take longer than 1 second
> > > to complete, and some responses need some delay before
> > > the result becomes available.
> > > 
> > > Signed-off-by: Abdel Alkuor <alkuor@gmail.com>
> > 
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> Hold on!
> 
> You are not specifying the driver in the subject. You need to fix
> that.
> 
I will send new patches with their subject updated.

Thanks,
Abdel


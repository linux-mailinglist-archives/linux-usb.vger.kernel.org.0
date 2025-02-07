Return-Path: <linux-usb+bounces-20338-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6A6A2CDFB
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2025 21:16:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2306A1886075
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2025 20:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E39B19F11B;
	Fri,  7 Feb 2025 20:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vxfYYmXe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FBB23C8C7
	for <linux-usb@vger.kernel.org>; Fri,  7 Feb 2025 20:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738959358; cv=none; b=X4wJuY4bxWajs0l9f3LMMH9QQmI/WcvspVxA733jPwgRT0BffeHb182Y6RmtK5C46V8nfBUilFxA8YoJLVLhswjjrFzJaDm7VKrc8H9vbLxvZ5KAhRfrqzZZMtJOe8QC/tqcc0AMoE7nq3o77jmdnBhwWp0SUSlfiXmuYfXJV9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738959358; c=relaxed/simple;
	bh=XGMvDYH+ZBfMomDZojSz38WvBMWSrd47TfBrAuw/d/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+3w9tTYXxHa+Yz92YSGpU3P1dWxiIkjIGr3tg404hREy0o0tCKiKRCB5ocDCtwNZXof+GBlqecdwTOoRHVAjMJ4cXOKrVjTAOZzSFh5BnxaLLAH6ACgUPV5OTCcLC+FxGpFQwia/BTlgftJbnPXN/x/wp+gwLHljJc0r2QZYmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vxfYYmXe; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-544ff616065so734047e87.1
        for <linux-usb@vger.kernel.org>; Fri, 07 Feb 2025 12:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738959355; x=1739564155; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dWNO5UzsnpexvCHlrSBPf+8oTEt2ops9lZPp4je2o8A=;
        b=vxfYYmXea0RtSKNilsy51CPRBziKc+SC7dp7pmfANTyveIfC22GH1Ur7Dt24Dshgcm
         HDvzJdn16pWoRPZapQ57vBJ919vOAWyamgmey/EgRhsb2LKJZ9CjGIxns6qhQ3cy29QU
         N3EEnSiattzr4rIaxiVLQrA2EQH2Z8RyEuXkQw3yqa1rj/wvoHSIpl9Wc3ztQboVuTFo
         NGxJXtiU0+PlxTkaN8OEcgxSSTP546uumjIiePrCcIGq5WxJ2pjllbT+aUq80QIDYO7X
         lhqDYTM7HZAUMXDSEd+6NwQQ1MBBj5oO9Ehnh2EAfIiWwqUhelEUb50H9Zsu+3jCCJY7
         v2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738959355; x=1739564155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWNO5UzsnpexvCHlrSBPf+8oTEt2ops9lZPp4je2o8A=;
        b=Wu1jUQx70NCutWbz3ghQ5B8+XGfNy6LlLYH3yjDo+YF4WCCcO/N7t//Bf0q7xF3z0Y
         K79S04qtHcmn31sMjpR/yz8SiWa7GknA7KLTXlvT8UKJmwbTqdNiT526QBgJ6AXod5in
         m/L8Zh1k+jHfzR3rgA1rfJ41pc/AT3BVp3PiTknFSLLAhCfzXY5nt1Ov6g6p1OPGk32s
         vkVzyEWU1svqlSp7IDfknk4JdO8KfLWJjCBGD6NFO27pDZo7djzEa92XVsf10D4heknk
         ASDZJ/7rzxD0Ku5jNaaVmCPhFCaHPOPbMiWJgUGwezpXDa3W2WYaFJn0yb0JnpgVh6Kc
         FUQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRhWh1n4tJNBm3Soy9YIIn7BXFEBZyiCGdXxLtO5lo3jmEgnPJfrXV7m8sBs/xWvuW+YIh1WEt31w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjwn8g8+XPXGa5Ft+CQBLVtsiOhTihrJgoxVGhz/ZR96gxYPVX
	/WkkTiAhEvIQhvizRoRyXBkGiX65MXInBf2C4tC+gYF4K4zi2LlCBFjFUW+lJpc=
X-Gm-Gg: ASbGncvs0s8mCBBhGmGa5mDJ1JAjEDje8STGZ2H2ZwlAbL4gzVw62lbJCmuZtEZHCL2
	MHlH32JNNtlisrW4sLi5kGRMzHNx7/JjkGrrGOXTNp2AQlnHt5xg6IFr80+w6Eylhv25i5c69MR
	IQ+GCnqGq2dBnF23lsM0zCmlA9Sk3zGWXaAOu1/fU/1EXTYy1nlrSmoc5p1j7t2HdFm9UQ+a2lY
	OyWQwWdGa8LOugOM37uP2EkikMKqpUWpqEB5nMnejU81yFPm4ngd5es7ZJp2NcoXXflpFc3QKwz
	jOxJZgijk8mtaf9zufKWJj672HuafWAq47VY7e2B9iNr23nOi2jtn1qqskSVW3ua3mL4CWM=
X-Google-Smtp-Source: AGHT+IGSmIUydg0+R0j/FoBoW9Qs9XCT7GS44GYVcTAmwx8jzTkr7kYBEUacuIIicC7/zwZ1PEFX2w==
X-Received: by 2002:a05:6512:39cd:b0:544:132e:155d with SMTP id 2adb3069b0e04-54414ae06dcmr1783151e87.39.1738959353946;
        Fri, 07 Feb 2025 12:15:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441053eb99sm548152e87.22.2025.02.07.12.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 12:15:53 -0800 (PST)
Date: Fri, 7 Feb 2025 22:15:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Pavan Holla <pholla@chromium.org>, 
	"Christian A. Ehrhardt" <lk@c--e.de>, Jameson Thies <jthies@google.com>, 
	"Katiyar, Pooja" <pooja.katiyar@intel.com>, "Pathak, Asutosh" <asutosh.pathak@intel.com>, 
	"Jayaraman, Venkat" <venkat.jayaraman@intel.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] usb: typec: ucsi: Command mailbox interface for
 the userspace
Message-ID: <mpe6hgyqmw5eohrwulzy7ujdrlgccgqxwdjdjq7zmsdhsemzcd@b6q2hu5ezvqv>
References: <20250206141936.1117222-1-heikki.krogerus@linux.intel.com>
 <20250206141936.1117222-2-heikki.krogerus@linux.intel.com>
 <2025020643-federal-uneatable-5da4@gregkh>
 <Z6YE4mJHx1zHNW8d@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6YE4mJHx1zHNW8d@kuha.fi.intel.com>

On Fri, Feb 07, 2025 at 03:04:34PM +0200, Heikki Krogerus wrote:
> On Thu, Feb 06, 2025 at 03:51:48PM +0100, Greg Kroah-Hartman wrote:
> > On Thu, Feb 06, 2025 at 04:19:31PM +0200, Heikki Krogerus wrote:
> > > Some of the UCSI commands can be used to configure the
> > > entire Platform Policy Manager (PPM) instead of just
> > > individual connectors. To allow the user space communicate
> > > those commands with the PPM, adding a mailbox interface. The
> > > interface is a single attribute file that represents the
> > > main "OPM to PPM" UCSI data structure.
> > > 
> > > The mailbox allows any UCSI command to be sent to the PPM so
> > > it should be also useful for validation, testing and
> > > debugging purposes.
> > 
> > As it's for this type of thing, why not put it in debugfs instead?
> > 
> > > +static ssize_t ucsi_write(struct file *filp, struct kobject *kobj,
> > > +			  const struct bin_attribute *attr,
> > > +			  char *buf, loff_t off, size_t count)
> > > +{
> > > +	struct ucsi_sysfs *sysfs = attr->private;
> > > +	struct ucsi *ucsi = sysfs->ucsi;
> > > +	int ret;
> > > +
> > > +	u64 *control = (u64 *)&sysfs->mailbox[UCSI_CONTROL];
> > > +	u32 *cci = (u32 *)&sysfs->mailbox[UCSI_CCI];
> > > +	void *data = &sysfs->mailbox[UCSI_MESSAGE_IN];
> > > +
> > > +	/* TODO: MESSAGE_OUT. */
> > > +	if (off != UCSI_CONTROL || count != sizeof(*control))
> > > +		return -EFAULT;
> > > +
> > > +	mutex_lock(&sysfs->lock);
> > > +
> > > +	memset(data, 0, UCSI_MAX_DATA_LENGTH(ucsi));
> > > +
> > > +	/* PPM_RESET has to be handled separately. */
> > > +	*control = get_unaligned_le64(buf);
> > > +	if (UCSI_COMMAND(*control) == UCSI_PPM_RESET) {
> > > +		ret = ucsi_reset_ppm(ucsi, cci);
> > > +		goto out_unlock_sysfs;
> > > +	}
> > > +
> > > +	mutex_lock(&ucsi->ppm_lock);
> > > +
> > > +	ret = ucsi->ops->sync_control(ucsi, *control, cci, NULL, 0);
> > > +	if (ret)
> > > +		goto out_unlock_ppm;
> > > +
> > > +	if (UCSI_CCI_LENGTH(*cci) && ucsi->ops->read_message_in(ucsi, data, UCSI_CCI_LENGTH(*cci)))
> > > +		dev_err(ucsi->dev, "failed to read MESSAGE_IN\n");
> > > +
> > > +	ret = ucsi->ops->sync_control(ucsi, UCSI_ACK_CC_CI | UCSI_ACK_COMMAND_COMPLETE,
> > > +				      NULL, NULL, 0);
> > > +out_unlock_ppm:
> > > +	mutex_unlock(&ucsi->ppm_lock);
> > > +out_unlock_sysfs:
> > > +	mutex_unlock(&sysfs->lock);
> > > +
> > > +	return ret ?: count;
> > > +}
> > 
> > This worries me, any userspace tool can now do this?  What other "bad"
> > things can it to the connection?
> 
> Although, there is actually only a limited number of things that you
> can do to the connection using UCSI, that is definitely a concern.
> 
> The PPM (which is the EC firmware in most cases) is expected to prevent
> any harmful or "unauthorized" UCSI commands from being executed, but
> I'm not sure there is any guarantees for that at the moment.
> 
> > > +int ucsi_sysfs_register(struct ucsi *ucsi)
> > > +{
> > > +	struct ucsi_sysfs *sysfs;
> > > +	int ret;
> > > +
> > > +	sysfs = kzalloc(struct_size(sysfs, mailbox, UCSI_MAILBOX_SIZE(ucsi)), GFP_KERNEL);
> > > +	if (!sysfs)
> > > +		return -ENOMEM;
> > > +
> > > +	sysfs->ucsi = ucsi;
> > > +	mutex_init(&sysfs->lock);
> > > +	memcpy(sysfs->mailbox, &ucsi->version, sizeof(ucsi->version));
> > > +
> > > +	sysfs_bin_attr_init(&sysfs->bin_attr);
> > > +
> > > +	sysfs->bin_attr.attr.name = "ucsi";
> > > +	sysfs->bin_attr.attr.mode = 0644;
> > > +
> > > +	sysfs->bin_attr.size = UCSI_MAILBOX_SIZE(ucsi);
> > > +	sysfs->bin_attr.private = sysfs;
> > > +	sysfs->bin_attr.read_new = ucsi_read;
> > > +	sysfs->bin_attr.write_new = ucsi_write;
> > > +
> > > +	ret = sysfs_create_bin_file(&ucsi->dev->kobj, &sysfs->bin_attr);
> > 
> > You raced with userspace and lost, right?  Why are you dynamically
> > creating this attribute, can't you just use a static one?
> 
> The size of the attribute depends on the UCSI version.
> 
> > But again, why not debugfs?  I'd feel a lot more comfortable with that
> > instead of sysfs.
> 
> I would actually prefer debugfs for this, but this is in any case
> not primarily for debugging and validation.
> 
> The initial goal was to supply the user space some way to control the
> EC's power related policies using UCSI commands such as
> SET_POWER_LEVEL and GET_POWER_LEVEL (guys, please correct me if I got
> that wrong).

It generally feels that exporting the whole unmoderated channel to the
firmware just to set power level is wrong. It should be interfaced
through the PSY driver.

> 
> But I'm now again wondering could those power policy tasks be handled
> using the UCSI power supplies after all? Venkat, did you look into
> that?
> 
> thanks,
> 
> -- 
> heikki

-- 
With best wishes
Dmitry


Return-Path: <linux-usb+bounces-11369-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAB390B1A5
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 16:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C861283C0D
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 14:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67FD8195F13;
	Mon, 17 Jun 2024 13:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uoVhawU9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8E3194A43
	for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 13:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718631013; cv=none; b=BF8FJpW/Dy7Lar6zauxLomdzgSmW2ILR2xorAmVPJJVpiH1B8HBrS2fQjmUn7pRCL19w5gTpIaNAIw+IJaWxdD/Y/o0bDnn1EUhpuQu5ZC6NP6Fa1BEo/Yv9V4JkF2WFCrngYkICvdcjMLTPzc7F8dKvBNLu6umrUMfYE0dwvt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718631013; c=relaxed/simple;
	bh=mSADwJ94zBloYHJDm5C7zD/b04tsB1y+mhicFNXi0TY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LNn5pxOQq9ystV4yfBtGoU16tD0j+ucePQESaHZKtAMSy316o6ehkKDzuuvjyg7M9q/9jkTXmYMcwQin6VhQnpYc8Ev+MVVhmYVhhj+2WibSgnzH0nKAMFLuEjXodD6pw8XDLakp/oUnexBWIeNPswblGVAqZjTMenqB6X0B2rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uoVhawU9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-35f1c209893so4654193f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 06:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718631010; x=1719235810; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g/xvsBn58w29gfFOc3XEQwg0vQMc0MnMYz8ijXyukkQ=;
        b=uoVhawU90yn7EfpG6YqKQWLWNL1vmvFClPQ5YxSgBD2HzdLixLA+gMELX/eF2oMqZv
         79wEHe5O8LMVEgsO/ej8Nd08lqscRyjHvse3OEp3Yl60rcSqjKQutVe4Oga8CZ2vl02s
         UcMwig1yZoy8JUG5PoJw9EO8+JEgcemktwtgjDwPknXdBWHms7N/0eTJI/iTdGDm4bKt
         xjmkQtCcMr2473I0QtXabGpT+7eDROpg3HaYY/Wjdhyigwyug8S38Gibq7XPlRMg4uk/
         4fcpKwERIrYwSGHXm0fZ0CD9LIKS9uUN4qkJSbCtMSHimdnfhSE6IqbYJgLwBAm77Ibo
         Yniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718631010; x=1719235810;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g/xvsBn58w29gfFOc3XEQwg0vQMc0MnMYz8ijXyukkQ=;
        b=CVurLxbMyWTL1V6ZOTLQs6oVr77NHOe0xCE3FE/ZqgYbqkBxpvpipQ9XcTwIsRvPNu
         b6/UyNvhWoy0kP7VOh/jI2w9zUw3ILKagkkyNwkE2oO6WQ8nDc/qCNMYC5qnNAuiFhPx
         mUlqVjuYQQANMyrkj1vKYe43JOxSFxV66KceO2mg0Z+IdIQRNqXMNWkepvNDXw+p14h7
         SKz2P1+pdNjB2C2bxgbTlEKlq/iTDv5lESA7kjRNI7sx90U7YEIC/YN6uIAKzJL8EEfL
         QZDkpm0K5//7zSomAUDQ+3Us3VN6K5wp+722IP8rxvgCcvcsUF3d1vVZiG7vZHclydVv
         6ddw==
X-Gm-Message-State: AOJu0Yzc/R6aKn5csSisLGdoXfAHIZRURvYUV2TA0l265Pv6I12vCuVz
	gi2oIDqcYUaW9sGLB952F0ehhJovjoZSup5ItCxXb4BGk2qhDfLgxIiE+iffNwOhbAh2Tk1Z5H/
	k
X-Google-Smtp-Source: AGHT+IFglTmwytlkXUoaUMjfulAac2Y9KFaxN7/kCw61UQY7ZSDLDRyJjIr1hN8x/l3QLYFzOH/asg==
X-Received: by 2002:adf:f308:0:b0:360:6fc3:5676 with SMTP id ffacd0b85a97d-3607a7833f7mr7210821f8f.50.1718631010082;
        Mon, 17 Jun 2024 06:30:10 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36079d78ce2sm10617549f8f.19.2024.06.17.06.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:30:09 -0700 (PDT)
Date: Mon, 17 Jun 2024 16:30:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org
Subject: [bug report] usb: typec: tcpm: Add callbacks to mitigate wakeups due
 to contaminant
Message-ID: <1d6a5eea-2f87-48ce-8176-b50153b27c09@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Badhri Jagan Sridharan,

Commit 599f008c257d ("usb: typec: tcpm: Add callbacks to mitigate
wakeups due to contaminant") from Jan 14, 2023 (linux-next), leads to
the following Smatch static checker warning:

	drivers/usb/typec/tcpm/tcpm.c:4620 run_state_machine()
	error: we previously assumed 'port->tcpc->check_contaminant' could be null (see line 4607)

drivers/usb/typec/tcpm/tcpm.c
    4600 static void run_state_machine(struct tcpm_port *port)
    4601 {
    4602         int ret;
    4603         enum typec_pwr_opmode opmode;
    4604         unsigned int msecs;
    4605         enum tcpm_state upcoming_state;
    4606 
    4607         if (port->tcpc->check_contaminant && port->state != CHECK_CONTAMINANT)

Assume that ->check_contaminant is NULL and port->state == CHECK_CONTAMINANT

    4608                 port->potential_contaminant = ((port->enter_state == SRC_ATTACH_WAIT &&
    4609                                                 port->state == SRC_UNATTACHED) ||
    4610                                                (port->enter_state == SNK_ATTACH_WAIT &&
    4611                                                 port->state == SNK_UNATTACHED) ||
    4612                                                (port->enter_state == SNK_DEBOUNCED &&
    4613                                                 port->state == SNK_UNATTACHED));
    4614 
    4615         port->enter_state = port->state;
    4616         switch (port->state) {
    4617         case TOGGLING:
    4618                 break;
    4619         case CHECK_CONTAMINANT:
--> 4620                 port->tcpc->check_contaminant(port->tcpc);

then we're in case CHECK_CONTAMINANT and the function pointer is NULL.

    4621                 break;
    4622         /* SRC states */
    4623         case SRC_UNATTACHED:
    4624                 if (!port->non_pd_role_swap)
    4625                         tcpm_swap_complete(port, -ENOTCONN);
    4626                 tcpm_src_detach(port);
    4627                 if (port->potential_contaminant) {
    4628                         tcpm_set_state(port, CHECK_CONTAMINANT, 0);
    4629                         break;
    4630                 }
    4631                 if (tcpm_start_toggling(port, tcpm_rp_cc(port))) {
    4632                         tcpm_set_state(port, TOGGLING, 0);
    4633                         break;

regards,
dan carpenter


Return-Path: <linux-usb+bounces-18647-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F449F6A41
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 16:42:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5F841881F2C
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 15:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26A61DFD9C;
	Wed, 18 Dec 2024 15:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s6otvW7a"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C87119B5B1
	for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 15:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734536524; cv=none; b=qK3dWkaFjJt4IhneGDOFGXeVYFIoUK/hLu7Zsz7qMXgxml4U2mMNqKva4RpbH+6C4pN9FmEk/aEV33UDFdLCbhtGqDdvuiShdu6KSV/FXret1Mw3hG5mGm/36JASD8cRtmxxPj6J23+jwOWJhlWRgzBE+6vsXKgcRFUwqnyCNQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734536524; c=relaxed/simple;
	bh=h+XeExBDgd5gL6dlbTSl87Rvr5eBKUV+3bhND4e9Wto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZmxryc66WLtAZ885zg7N5CN7SF8FRkb3Xl5R94VkBGEzGJ4hNsZcuD9iZXLoabG0SxdAqfNq88NX8QSofadSBdfckaSLN0ZjFr6uV7050H+E3HiyegYVqi5lfflEkvGAL0so9R66PcuhGywk/9LazLYegj0cBJcVzKEQjcePS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s6otvW7a; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa68b513abcso1118728266b.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 07:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734536521; x=1735141321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wuPxDvTX7vw6Ikag7mefG62YIQDwW9qirQPmBJpybBg=;
        b=s6otvW7ajEMZvqOm8Wbm1DtMfm1HmyPqWLKMLh6M6fcjMzB/N8VLp1JVPlwfh7Ku1h
         /vZgvMC3m33EDT1TQ21KqJ3Q68qNcC9C6TNyWsvooGkoysqkCOUgbqBExVBdvuOiPs8y
         bhEbYlsJdeb8iMn50dFUmrVSgf950aOGPQ+nK6mss+9ThhxzCawvonLyYxD/eHrZhh+o
         hwSSoPtTrUSOPAn/5eXt2C6A6j4qHXd+WXKnjV7TMcCwFXi0yMvXRgrmIIdg+OuYWgQj
         Btm3CMjzrUwwN6e35uz6zeLjoPhbkpbefBKydcLqxun7PcIyKrn73S4az2azTMG0SBj6
         7S6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734536521; x=1735141321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuPxDvTX7vw6Ikag7mefG62YIQDwW9qirQPmBJpybBg=;
        b=HkoZwVu5omsHwjmfAXzIlrLDWQi8UsrfWdwQ+IJK52SzQuXIUV5RrAeiopWrcz9yks
         lJdsy+BgAw1Ne2CloeckzzJXS9MStWjEo/d8aV1pel8Ll8sx6n+r9+9IVy/DywnLG5VX
         WXkniBBX2cpncN/QeZn2Fa/AGDeu85FtX1FOzmjz4SgEWt9B2875mnu8Tozpg/7zVKm3
         dGWmbq4XbbdtECQZsOddRcD/ATmcKpDSIxYRhXARmfoXmdQNtuq4byJLua+TA/g5FQjn
         0tVj+t4WkV6v8ase1HRLOhByeJ+yjuGpkbSbJDN0EgOskq2IRVVVcX8jRgfmcjJeMEpN
         tmWA==
X-Forwarded-Encrypted: i=1; AJvYcCX1JrwO6t2BWNr7bpLxY4oWdWW4OoZnaQ1T61yJXuJJrzskEROqroinIkroPqV4zXvQAPSIXQVYEWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfUh7Lm3r1LWG//1gZWEV3fYG/5h1GGHiilSs8ZVmoT4KMOirN
	VRQTlO1Qb9aqL0uDdJ6wW1jMkKKItiIcrPKezs7BwBpzby2vreiKjwU+ANw6QZk=
X-Gm-Gg: ASbGnctji8p4+1IQ4RVKqm+fxa/F+zfmHxjAaUp2csChmfGW3wQZLS1xDxuUTMN1BEG
	XIGYK936JYnsuM2ZZKDo/o2ByTkZXPJHIa94TN5oDJ/ln3SccRUtnc4RIjoJbsYhyZpxOkUgxei
	KLn0ddbc2+yzjNjQcc6i2vMm7mfJjqFo9+p7Hcyz084x7j9gI4srzUIrDlfQL61ytZXFbvB3wHw
	AA6GKWz05aPOIwYT72YRspEH4Ay0wJBx0A7GCJ2xJCukoVuxRG8uOkFKCrBRA==
X-Google-Smtp-Source: AGHT+IGarXmwMkeMqU2NZRVbUAa61OHGnCxtHAVf/FFcAIMSBvhxQ1z7QNQ2Pk8ItpKNlg/4dPjA1Q==
X-Received: by 2002:a17:907:6e93:b0:aa6:9599:a9af with SMTP id a640c23a62f3a-aabf4907633mr283425566b.53.1734536520682;
        Wed, 18 Dec 2024 07:42:00 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9635998csm578833166b.108.2024.12.18.07.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 07:42:00 -0800 (PST)
Date: Wed, 18 Dec 2024 18:41:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Miao.Zhu" <Miao.Zhu@synopsys.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, xu.yang_2@nxp.com,
	andre.draszik@linaro.org, emanuele.ghidoli@toradex.com,
	heikki.krogerus@linux.intel.com, m.felsch@pengutronix.de,
	rdbabiera@google.com, u.kleine-koenig@baylibre.com,
	conor+dt@kernel.org, jun.li@nxp.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	Jianheng.Zhang@synopsys.com, James.Li1@synopsys.com,
	Martin.McKenny@synopsys.com
Subject: Re: [PATCH v4 1/2] usb: typec: tcpm: tcpci: Make the driver be
 compatible with the TCPCI spec [Rev 2.0 Ver 1.0, October 2017]
Message-ID: <9d3ab6fe-f875-493e-935a-976ff1a9cdf1@stanley.mountain>
References: <20241218085933.2790127-1-miao@synopsys.com>
 <20241218085933.2790127-2-miao@synopsys.com>
 <b5e5cd33-2b59-4e93-8acd-379290917e42@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5e5cd33-2b59-4e93-8acd-379290917e42@stanley.mountain>

On Wed, Dec 18, 2024 at 12:33:42PM +0300, Dan Carpenter wrote:
> The subject is too long.  You've sent v2, v3, and v4 today.  Please, wait
> for a day between resends.
> 
> On Wed, Dec 18, 2024 at 09:59:32AM +0100, Miao.Zhu wrote:
> >  static int tcpci_set_pd_rx(struct tcpc_dev *tcpc, bool enable)
> > @@ -741,33 +748,86 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
> >  		struct pd_message msg;
> >  		unsigned int cnt, payload_cnt;
> >  		u16 header;
> > +		unsigned int frame_type;
> > +		enum tcpm_transmit_type rx_type;
> >  
> >  		regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
> >  		/*
> >  		 * 'cnt' corresponds to READABLE_BYTE_COUNT in section 4.4.14
> >  		 * of the TCPCI spec [Rev 2.0 Ver 1.0 October 2017] and is
> >  		 * defined in table 4-36 as one greater than the number of
> > -		 * bytes received. And that number includes the header. So:
> > +		 * bytes received. And that number includes the header.
> > +		 * In Section 4.4.14 of the TCPCI spec [Rev 2.0 Ver 1.0 October, 2017],
> > +		 * the RECEIVE_BUFFER comprises of three sets of registers:
> > +		 * READABLE_BYTE_COUNT, RX_BUF_FRAME_TYPE and RX_BUF_BYTE_x.
> > +		 * These registers can only be accessed by reading at a common
> > +		 * register address 0x30h.
> >  		 */
> > -		if (cnt > 3)
> > -			payload_cnt = cnt - (1 + sizeof(msg.header));
> > -		else
> > -			payload_cnt = 0;
> > +		if (tcpci->data->RX_BUF_BYTE_x_hidden) {
> > +			u8 buf[TCPC_RECEIVE_BUFFER_MAX_LEN] = {0,};
> > +			u8 pos = 0;
> > +
> > +			/* Read the count and frame type in RECEIVE_BUFFER */
> > +			regmap_raw_read(tcpci->regmap, TCPC_RX_BYTE_CNT, buf, 2);
> > +			/* READABLE_BYTE_COUNT */
> > +			cnt = buf[0];
> > +			/* RX_BUF_FRAME_TYPE */
> > +			frame_type = buf[1];
> > +
> > +			/* Read the content of the USB PD message in RECEIVE_BUFFER */
> > +			regmap_raw_read(tcpci->regmap, TCPC_RX_BYTE_CNT, buf, cnt + 1);
>                                                                          ^^^
> buffer overflow?
> 
> > +
> > +			pos += 2;
> > +			memcpy(&msg.header, &buf[pos], sizeof(msg.header));
> > +
> > +			if (cnt > 3) {
> > +				pos += sizeof(msg.header);
> > +				payload_cnt = cnt - (1 + sizeof(msg.header));
> > +				if (WARN_ON(payload_cnt > sizeof(msg.payload)))
> > +					payload_cnt = sizeof(msg.payload);
> > +				memcpy(&msg.payload, &buf[pos], payload_cnt);
> 
> There is existing code later which does bounds checking on payload_cnt,
> but it's too late.  We would have already overflowed buf[] and
> msg.payload here.
> 

This line is obviously fine.  It's only buf[] earlier from regmap_raw_read()
I'm worried about.

regards,
dan carpenter



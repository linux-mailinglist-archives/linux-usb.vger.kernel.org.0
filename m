Return-Path: <linux-usb+bounces-36868-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHg+DrpA+GnCrwIAu9opvQ
	(envelope-from <linux-usb+bounces-36868-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 08:46:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6C14B8FBA
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 08:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1EB393003702
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2026 06:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1142C027E;
	Mon,  4 May 2026 06:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jmV7dOud"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E971F5825
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 06:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777877168; cv=none; b=qtrqI63pbVre36i91cyz5ghfKJ8R+iNE/d/2YI51QkaoCwW+srFixE06+rGC7OOVBTOAPTBFw3jrSaL6hQG1dqHOTwb3gs5q11ahb+8u3Ja92euKDOpThIEnfkb7E5VVxKIoPR3frAVQI1d/qjcHj8t0x3zjpRyTCxKygslZdI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777877168; c=relaxed/simple;
	bh=WOUTFRQXY7u4mCgzjAgnVT8wNzDI/PXA4wTabljAAkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m4t1jQtLXURLorMbMozrWoWnWDFdFoxLBa8Q/3kaYIWi3tZdzUsNPoRsDYs7BOaTmC3nDFGWeYSochqLJkvPxg1CwwafFcqIS26CyKpu2LILKJCLelcYbvWozIGQGFUy/nRxw72HokiCW14eijPqNdkF7gFlIVQn/eeD3unbAP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jmV7dOud; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d7645adbdso2217488f8f.1
        for <linux-usb@vger.kernel.org>; Sun, 03 May 2026 23:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777877165; x=1778481965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOccawuCoFWsjijYdwToilKKz9XDVnegxFTh6EZHPuU=;
        b=jmV7dOudGI90beUFDyMX3vQJyJCJf8b62/jkvuM0i9UFQQR13b3SU1AmvrK0xM50sC
         vFPZvy5tC5+XeXznxOXM/LBNdBawkGwjMP5B5J+a9jn/V0ZHxjjzgz3EhFeNOeaxamMq
         KS202Wwavbvdo48XMjpJ3TZKSOsLA0TvSiOoTEvEXEL7vZAnvriLPw/2QhJ//Nuurhys
         Hw1YMSfO/YFRMp0lRpk6881pyNk6s93t1TnMDevL5EFFw//mrH4J8MFZj/8GCH5yBqUH
         faUz1HI7KgOGbbSLvflMCPkGI9EzFzVt9357IzfVB5X46SQ2+NVNhWcxD2a6DsJoJHtn
         xtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777877165; x=1778481965;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOccawuCoFWsjijYdwToilKKz9XDVnegxFTh6EZHPuU=;
        b=AW+WKJ/gnwu6atKdAEzeRKhhGt2MIKFUq+/1rGPjioUosx/mO8AdGGUR3StAh/01bI
         Jt5v+zOSOcvBpU/brbJeAc+A9qK3/wYH67AOU2T0zUSva/uCqRC45r5A1XpzYkU7AWMP
         j26vyWpjRFjDiDQpMnI5qAQqwJT1cwrC2hlOmSOZkMWE/+XpgaCUsTmPFnEmWLR3euFQ
         wLh6f5dIfgY/SiYhNZkKIZFLnQv5u5ZQ5aG5r1vvzI2q22vQZLHgF6b2ibY6iuFrZXqs
         LOsrzjdybu3AB60C+l0eu3/qAvz4XomGNJa41PcZH0bd6dB5w9/tu257sYY0gvIemrtJ
         12gg==
X-Forwarded-Encrypted: i=1; AFNElJ+KTp4ZianUp0a1XoKc0FOI9yvbwiBLrc+p7VDXbezrbW0gfLFATm5zyFRtQT39lLbH6Fmo00YKdVU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+P1Hhbb9evHmcLEre+anvWBj5JyJZVlpdyPq/WsyonqNbWF27
	iYLt7FfGgdYudC+yZcE8IcircAHT+AAXhTQeEfgjLL5k0MdicTZ4Hd+6zWUaJ1M90As=
X-Gm-Gg: AeBDievpRT6vxvkSUw428dT3LTD+aOGp8fqKBRLxB2gdJ06KZG+c4Ww7yQ6glTXXQWU
	Hsw/dj/0ipYMGV43zILT5pfR0erwMYNvJrHYz95L7NbnB0vg8v1hyZXvR6xcPKrjad0IeRodgQx
	fMLc80VhcrqFibUg8f68Eb9+bYHtNJIANxjbpWdF8ZhXwcaMnbXXjgaEhlLJ0UE/Npx5c4UWR1h
	A//hmmmhANcEz1YIRu++ksFolpHy3PANssYfCJAUg0vTzewg5sHkCSORUEXiV4+rHsF7dFZsg5y
	glbgGNnVCHvNp8U3OK3lSw3NkOw26loGBzvM7LLl9a54mZMVoAZKlj25meh+Q+a3b8Qm1PPZSqQ
	3TU6weu3BSQKzThMZYkRWmTNa9Nv8T3AJc/1Tldcpjr7xMuS92aMzYd6x86bV1KUz88X5lr2TMK
	Lm2n4IYhe+mv1uIU3UiwPdFvRVx4b6WwKqyUXYvsA+rzlwIC/UZH5lDVMLHWqZCQdG3SbK7c0Po
	QLkOc4RGrIDx7hiKQ==
X-Received: by 2002:a05:6000:2003:b0:44a:2509:fbf with SMTP id ffacd0b85a97d-44bb63f5834mr12677316f8f.21.1777877165312;
        Sun, 03 May 2026 23:46:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:4245:af61:1735:3752? ([2a01:e0a:106d:1080:4245:af61:1735:3752])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8ef50e59sm22923096f8f.10.2026.05.03.23.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 23:46:04 -0700 (PDT)
Message-ID: <d774b2f2-75f8-485f-830f-2a7a5dac1c23@linaro.org>
Date: Mon, 4 May 2026 08:46:08 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] usb: dwc3: qcom: Modify interrupt handling for EUSB2 Phy
 targets
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260502095616.666938-1-krishna.kurapati@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260502095616.666938-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2D6C14B8FBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36868-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]

Hi,

On 5/2/26 11:56, Krishna Kurapati wrote:
> Modify interrupt handling for EUSB2 Phy targets. Enable DP Interrupt
> when an Low speed device is connnected and enable DM interrupt when
> a High Speed/ Full Speed device is connected.

Could you explain _why_ and not the content of the patch ?

> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> Tested remote wakeupon Glymur device by button press from a headset
> connected to both Type-C and Type-A ports.
> 
>   drivers/usb/dwc3/dwc3-qcom.c | 63 ++++++++++++++++++++++++++++++------
>   1 file changed, 54 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index f43f73ac36ff..5956821eab45 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -60,6 +60,10 @@ static const u32 pwr_evnt_irq_stat_reg[DWC3_QCOM_MAX_PORTS] = {
>   	0x238,
>   };
>   
> +struct dwc3_qcom_platform_data {
> +	bool			uses_eusb2_phy;
> +};
> +
>   struct dwc3_qcom_port {
>   	int			qusb2_phy_irq;
>   	int			dp_hs_phy_irq;
> @@ -85,6 +89,7 @@ struct dwc3_qcom {
>   	struct icc_path		*icc_path_apps;
>   
>   	enum usb_role		current_role;
> +	bool			uses_eusb2_phy;
>   };
>   
>   #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
> @@ -272,15 +277,21 @@ static void dwc3_qcom_disable_wakeup_irq(int irq)
>   	disable_irq_nosync(irq);
>   }
>   
> -static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *port)
> +static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom *qcom, int i)
>   {
> +	struct dwc3_qcom_port *port = &qcom->ports[i];
> +
>   	dwc3_qcom_disable_wakeup_irq(port->qusb2_phy_irq);
>   
>   	if (port->usb2_speed == USB_SPEED_LOW) {
> -		dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
> +		dwc3_qcom_disable_wakeup_irq(qcom->uses_eusb2_phy ?
> +					     port->dp_hs_phy_irq :
> +					     port->dm_hs_phy_irq);
>   	} else if ((port->usb2_speed == USB_SPEED_HIGH) ||
>   			(port->usb2_speed == USB_SPEED_FULL)) {
> -		dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
> +		dwc3_qcom_disable_wakeup_irq(qcom->uses_eusb2_phy ?
> +					     port->dm_hs_phy_irq :
> +					     port->dp_hs_phy_irq);
>   	} else {
>   		dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
>   		dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
> @@ -289,8 +300,10 @@ static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *port)
>   	dwc3_qcom_disable_wakeup_irq(port->ss_phy_irq);
>   }
>   
> -static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom_port *port)
> +static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom *qcom, int i)
>   {
> +	struct dwc3_qcom_port *port = &qcom->ports[i];
> +
>   	dwc3_qcom_enable_wakeup_irq(port->qusb2_phy_irq, 0);
>   
>   	/*
> @@ -303,11 +316,19 @@ static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom_port *port)
>   	 */
>   
>   	if (port->usb2_speed == USB_SPEED_LOW) {
> -		dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
> +		dwc3_qcom_enable_wakeup_irq(qcom->uses_eusb2_phy ?
> +					    port->dp_hs_phy_irq :
> +					    port->dm_hs_phy_irq,
> +					    qcom->uses_eusb2_phy ?
> +					    IRQ_TYPE_EDGE_RISING :
>   					    IRQ_TYPE_EDGE_FALLING);
>   	} else if ((port->usb2_speed == USB_SPEED_HIGH) ||
>   			(port->usb2_speed == USB_SPEED_FULL)) {
> -		dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
> +		dwc3_qcom_enable_wakeup_irq(qcom->uses_eusb2_phy ?
> +					    port->dm_hs_phy_irq :
> +					    port->dp_hs_phy_irq,
> +					    qcom->uses_eusb2_phy ?
> +					    IRQ_TYPE_EDGE_RISING :
>   					    IRQ_TYPE_EDGE_FALLING);
>   	} else {
>   		dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
> @@ -324,7 +345,7 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>   	int i;
>   
>   	for (i = 0; i < qcom->num_ports; i++)
> -		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
> +		dwc3_qcom_disable_port_interrupts(qcom, i);
>   }
>   
>   static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
> @@ -332,7 +353,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>   	int i;
>   
>   	for (i = 0; i < qcom->num_ports; i++)
> -		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
> +		dwc3_qcom_enable_port_interrupts(qcom, i);
>   }
>   
>   static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
> @@ -609,6 +630,7 @@ struct dwc3_glue_ops dwc3_qcom_glue_ops = {
>   
>   static int dwc3_qcom_probe(struct platform_device *pdev)
>   {
> +	const struct dwc3_qcom_platform_data *pdata;
>   	struct dwc3_probe_data	probe_data = {};
>   	struct device		*dev = &pdev->dev;
>   	struct dwc3_qcom	*qcom;
> @@ -624,6 +646,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>   
>   	qcom->dev = &pdev->dev;
>   
> +	pdata = device_get_match_data(dev);
> +	if (pdata)
> +		qcom->uses_eusb2_phy = pdata->uses_eusb2_phy;
> +
>   	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
>   	if (IS_ERR(qcom->resets)) {
>   		return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
> @@ -838,8 +864,27 @@ static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
>   	.prepare = pm_sleep_ptr(dwc3_qcom_prepare),
>   };
>   
> +static const struct dwc3_qcom_platform_data dwc3_qcom_pdata = {
> +	.uses_eusb2_phy = false,
> +};
> +
> +static const struct dwc3_qcom_platform_data dwc3_qcom_glymur_pdata = {

SM8550 was the first QCom upstream SoC to use eUSB, should it be covered as well like SM8650, X1, ... ?

Thanks,
Neil

> +	.uses_eusb2_phy = true,
> +};
> +
>   static const struct of_device_id dwc3_qcom_of_match[] = {
> -	{ .compatible = "qcom,snps-dwc3" },
> +	{
> +		.compatible = "qcom,snps-dwc3",
> +		.data = &dwc3_qcom_pdata,
> +	},
> +	{
> +		.compatible = "qcom,glymur-dwc3",
> +		.data = &dwc3_qcom_glymur_pdata,
> +	},
> +	{
> +		.compatible = "qcom,glymur-dwc3-mp",
> +		.data = &dwc3_qcom_glymur_pdata,
> +	},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, dwc3_qcom_of_match);



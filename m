Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98ED218CA13
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2020 10:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgCTJTm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Mar 2020 05:19:42 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46325 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbgCTJTl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Mar 2020 05:19:41 -0400
Received: by mail-lj1-f193.google.com with SMTP id d23so5562635ljg.13
        for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2020 02:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=G1EkJblVO5zCoZcnb+FYtBMO5YGWruSG9b3HDDXln5A=;
        b=gINkYw4/tCTO40bcUY3tM6/tS+UKatDq8YWFwmCnDxNshzPpzOjtjfeSmVRJMp1T/Q
         MeJ8keE6kzJGuwrPLD/mV2cW5ICFjWbZjWlg4tU5zcrvVmNqPS6o+Biknrgc98FheGfC
         OosOyaJuPfjfdD2UaiboF8PF51O+fvWTaQZZXnVWSHMaLp1eKl4mEN+6dccKh1TApxYg
         n9ET7PheA2qPwnXpkNoTxp45vmPp8tzON1xO3ygTrAsVTMgFLQ7jq1jmyGYcC9xtMs2R
         UgLgSUTCfvYkG8+XsDrkpk+6lBqMzJyheBV3jIs87g7QFITItZomjE3ghHFw+GkFkRp8
         CNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G1EkJblVO5zCoZcnb+FYtBMO5YGWruSG9b3HDDXln5A=;
        b=nzc//88hYQIP3VlEQhp9xQ6iUZK1FgoSbL1SFrxiMvqH9ZUMKL4UrGhP28SF929TAJ
         G6eVS98MIHVbTO5QOnkJtk9GnXj01P5hUWVQaJFLMrJGHX45nSNWd1A5rQ7cwgz3mtp0
         1us7CV5uPUdfjc9QhEGffH8P6FKSwGo3s2VaxRrquHg5eQoJJATI2hRnr7lyMqi5asyD
         UB8EBe1DPo9AWeVExPXhu8tpDzOcTwlM3WTJimFuNaJEtSUiwbyhxCdCE68zqLjZSzWr
         8/ubZjE94UKfBJPAujsxC0qkeJe3cCZV2XtNsUR1gXa/foPcXMUUAyfLnLGAs0HVkxWH
         p68w==
X-Gm-Message-State: ANhLgQ1aQ9F3TQ3IX4PLW+N8JVH5wRbCC2ACBYI3QyuKaG1VlPv5pfEH
        m9nDn6fgEN97VOFQehRjMbqJ7A==
X-Google-Smtp-Source: ADFU+vvDzGm6kL9GMOpiLRLLz1hqGaY0OeEmmRLiFm9LZ4Clkz7oLMEx6CoXWInltPiYZ9mCjJGE/w==
X-Received: by 2002:a2e:9e03:: with SMTP id e3mr4782859ljk.186.1584695979051;
        Fri, 20 Mar 2020 02:19:39 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4470:5581:e9c3:b2cd:6a52:420e? ([2a00:1fa0:4470:5581:e9c3:b2cd:6a52:420e])
        by smtp.gmail.com with ESMTPSA id u5sm3076086lfu.69.2020.03.20.02.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2020 02:19:38 -0700 (PDT)
Subject: Re: [PATCH 1/2] staging: rtl8712: Avoid multiple line dereference
To:     Gokce Kuler <gokcekuler@gmail.com>,
        outreachy-kernel@googlegroups.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
References: <cover.1584668081.git.gokcekuler@gmail.com>
 <340c8671b671ed9b1416cfc7790e0e4426f89371.1584668081.git.gokcekuler@gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f1aaa161-064b-6c13-f850-4b370fc71d85@cogentembedded.com>
Date:   Fri, 20 Mar 2020 12:19:27 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <340c8671b671ed9b1416cfc7790e0e4426f89371.1584668081.git.gokcekuler@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 20.03.2020 5:03, Gokce Kuler wrote:

> merge a line -> with a line ending with a sign

    What sign?

> Signed-off-by: Gokce Kuler <gokcekuler@gmail.com>
> ---
>   drivers/staging/rtl8712/rtl871x_mlme.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_mlme.c b/drivers/staging/rtl8712/rtl871x_mlme.c
> index cabdb35..74dac74 100644
> --- a/drivers/staging/rtl8712/rtl871x_mlme.c
> +++ b/drivers/staging/rtl8712/rtl871x_mlme.c
> @@ -944,8 +944,7 @@ void r8712_stadel_event_callback(struct _adapter *adapter, u8 *pbuf)
>   			pdev_network = &(adapter->registrypriv.dev_network);
>   			pibss = adapter->registrypriv.dev_network.MacAddress;
>   			memcpy(pdev_network, &tgt_network->network,
> -				r8712_get_wlan_bssid_ex_sz(&tgt_network->
> -							network));
> +				r8712_get_wlan_bssid_ex_sz(&tgt_network->network));
>   			memcpy(&pdev_network->Ssid,
>   				&pmlmepriv->assoc_ssid,
>   				sizeof(struct ndis_802_11_ssid));

MBR, Sergei

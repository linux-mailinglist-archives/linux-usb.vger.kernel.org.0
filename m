Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A0733E1425
	for <lists+linux-usb@lfdr.de>; Thu,  5 Aug 2021 13:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241150AbhHELwd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Aug 2021 07:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241152AbhHELwc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Aug 2021 07:52:32 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27CA9C061765
        for <linux-usb@vger.kernel.org>; Thu,  5 Aug 2021 04:52:17 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id m18so6716568ljo.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Aug 2021 04:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ty2sfnca5csj7MLb69ebHCpfLFQtiZw2YYHon5aW5h4=;
        b=f9PVoG8ecjdMLO0srP+lH0VVBVGY3+bmR04Bf5obAoAYDArYgEvoh84P6SXxwqRd9t
         jB3D+lxWDdhi2ph8WNTCtgQsIWY04J9vwGl8IUaOFTf+p3GkLrbWqJYcsApA7ttm4pfx
         ob/2SbfPYrdHh+wdJbxMNfR0QQsu+1tXz3mx7oV2K5WRa2zODMdAC6S0HLKL0NmzPOw/
         EIX14m4VpZSoIpHU8KGEBikzTs/zkHPFOycgehsp89v/9K7IdrLWCCuuo6T6hWWYN7uv
         fs3YmwpkylaDFMmQcD8PRlRiM5KX4iqNB/6hsy98weqm3YI/7Y+9GaxYkxe3hxE2QKgh
         VpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Ty2sfnca5csj7MLb69ebHCpfLFQtiZw2YYHon5aW5h4=;
        b=Kaz30hgrPOUP1rSRMNtXUmc8gekcx30Mfeg16eb0KciZyM/3T8NHVgwVzYIkNBVU2y
         c7pl18tkhnOO9JP23Fy8JBKX8Mg1fMqOiGMWlq0Jvxzwr1ILnLK/BD1UUOVShDcGoQAM
         vjmWLjYbP4LgnRuJpxvM9j1VobNbrDWbSkqf4yJNFw3d1orPMo6Pk1VQpay95MEs0OAC
         WJVeOdjhdlp10L9tfGSxFijZ2pmyFydVoPMleINSIPTo3yyk/ixb4eNtAfG2E2FVrgCo
         PReYhPEsCQQwWSUnzW1t2GWL3gDTs4RZV7DTyZKGpMx71WYILURSvQVLjuV1sTAq9vdk
         EUaQ==
X-Gm-Message-State: AOAM530CBkqQGS+qxp7cMVJ/hZG4Eifj8rZK5dPHp56g4YVlEU82QX7E
        EZZzOpSno0aR8SM+GMYgAhVToQq88xc=
X-Google-Smtp-Source: ABdhPJwUKoVHySz3WsQXAXIUck1iBKmiHMJVqH0J3vmsaU54TK9k0Ze61oF625YQZdmDinMS2g5Rhw==
X-Received: by 2002:a2e:a164:: with SMTP id u4mr2809005ljl.121.1628164335468;
        Thu, 05 Aug 2021 04:52:15 -0700 (PDT)
Received: from [192.168.1.100] ([31.173.81.246])
        by smtp.gmail.com with ESMTPSA id br4sm491415lfb.33.2021.08.05.04.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 04:52:15 -0700 (PDT)
Subject: Re: [PATCH] USB: serial: ftdi_sio: add device ID for Auto-M3 OP-COM
 v2
To:     David Bauer <mail@david-bauer.net>, johan@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
References: <20210804232522.43330-1-mail@david-bauer.net>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <f96cd59f-f391-71d9-07a4-f5ee9d9d9afa@gmail.com>
Date:   Thu, 5 Aug 2021 14:52:02 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210804232522.43330-1-mail@david-bauer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 05.08.2021 2:25, David Bauer wrote:

> The Auto-M§ OP-COM v2 is a OBD diagnostic device using a FTD232 for the

    M3?

> USB connection.
> 
> Signed-off-by: David Bauer <mail@david-bauer.net>
[...]
> diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_sio_ids.h
> index add602bebd82..755858ca20ba 100644
> --- a/drivers/usb/serial/ftdi_sio_ids.h
> +++ b/drivers/usb/serial/ftdi_sio_ids.h
> @@ -159,6 +159,9 @@
>   /* Vardaan Enterprises Serial Interface VEUSB422R3 */
>   #define FTDI_VARDAAN_PID	0xF070
>   
> +/* Auto-M3 Ltd. - OP-COM USB V2 - OBD interface Adapter */
> +#define FTDI_AUTO_M3_OP_COM_V2_PID	0x4f50
> +
[...]

MBR, Sergei

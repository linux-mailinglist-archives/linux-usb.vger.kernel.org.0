Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 331A8728149
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jun 2023 15:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236110AbjFHNYF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Jun 2023 09:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234860AbjFHNYE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Jun 2023 09:24:04 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02DF02738
        for <linux-usb@vger.kernel.org>; Thu,  8 Jun 2023 06:24:02 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b0236ee816so4652785ad.1
        for <linux-usb@vger.kernel.org>; Thu, 08 Jun 2023 06:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686230641; x=1688822641;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3Ec4GKe0wj+39kSSKtRyyNRXczGRfgI/XMt3CuBNzGk=;
        b=UzdwalVlIfCQRAUn/DdKNko3d0Y6P/+qh/XqUD9g3CejanV5YKuQyo5hLAxoRq74oh
         bu0lKVL7VXIuyahl7K+1B561AKV8y4hmwp7sVlWyjbYxjlnPONAP+l4288+Fzq5Dlv0d
         W2bQs+V0jHMuAO+s2Ply99HRurS8zPPF1L7l7DY7BXy/7hJwjBxgAwyfkylJ03NWAteb
         n7H3ZehVuBmF4Zyyo8gvgcV73RD+zKZdrCy+lcfZIbxnJyLPE6cqu19Q5VJlPjZ2WX3h
         vnU8578N9ZFrUQh5yGmjiG+rMTrFF7pP2tPmVdIpOKKXOj6tTrU0YB4mjdD35mfbXzl3
         bXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686230641; x=1688822641;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Ec4GKe0wj+39kSSKtRyyNRXczGRfgI/XMt3CuBNzGk=;
        b=KLoWGDkJW0CZhmKl/Vs+yZIX6PjVE82E7WM7WOOYXlRZREvX8kPbtWOPGS7BSBQaGf
         rj5lo0u5gFnKRVSD3EMrqx1ACgKjIfqTqT8JJOX1LZ1AbQPSHlA7s+pyCPO9VkyzoB8v
         tec15KW9Oaikjdo8Fou2spDMCBPRsOWnLlrLx/PcGn1WcNwma4Nu8sQIlxvKwOjOH/KP
         6pOATs441CrduS0N4wWAdDOftG0IP91muM5Yd2A5ClT5CSAJcdo2cDWG/V3KrhCHpbk+
         vtBA+Z7DBWk/ygUk0fgHXZwLZbF338tybf5/MDKKczLKxzmXgsoPwAZQwJnPzgvHkfd5
         2s9A==
X-Gm-Message-State: AC+VfDyVrxec4dgoBkQQsOA9J89RnYZIwY89WhaZryoHwb9os4I1xLxL
        1IM0DCNYV7FSYq/D7EneVvE=
X-Google-Smtp-Source: ACHHUZ4r0Ny77o+2Xe2t3NLkwFyfTgHmmrK0at6az1q+TQqq1WXLFNfc8K9V0XVfvTmngGAXrJC5HQ==
X-Received: by 2002:a17:902:dac6:b0:1b0:62e2:1f84 with SMTP id q6-20020a170902dac600b001b062e21f84mr2923759plx.5.1686230641308;
        Thu, 08 Jun 2023 06:24:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z10-20020a170903018a00b001b1f991a4d0sm1429961plg.108.2023.06.08.06.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 06:24:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0330ffea-d258-8fb8-ff89-5ebb0388f1ff@roeck-us.net>
Date:   Thu, 8 Jun 2023 06:23:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] usb: typec: tcpci: allow drp toggling for non-drp port
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, jun.li@nxp.com, zhipeng.wang_1@nxp.com,
        faqiang.zhu@nxp.com
References: <20230608112858.4405-1-xu.yang_2@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230608112858.4405-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 6/8/23 04:28, Xu Yang wrote:
> Some single power role Type-C port with dual data role, this kind of
> port connects non Type-C port for usb data will need tcpm to work to
> get polarity for orientation change and let Type-C port keep at fake
> power role to provide another non-default data role, so remove the drp
> port condition for now.
> 
> Has anyone encountered this use case? How do you handle this limitation
> in current tcpm with a better way? Please kindly share your thoughts.
> 

Have you ? This is an odd comment to make in the patch description.

Either case, I don't understand why one would need to enable toggling
under any circumstances if the port is not DRP. The description does
not explain how "need tcpm to work" correlates to enabling toggling on
non-DRP ports.

Guenter

> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>   drivers/usb/typec/tcpm/tcpci.c | 3 ---
>   drivers/usb/typec/tcpm/tcpm.c  | 6 +++++-
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index fc708c289a73..88559e749120 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -175,9 +175,6 @@ static int tcpci_start_toggling(struct tcpc_dev *tcpc,
>   	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
>   	unsigned int reg = TCPC_ROLE_CTRL_DRP;
>   
> -	if (port_type != TYPEC_PORT_DRP)
> -		return -EOPNOTSUPP;
> -
>   	/* Handle vendor drp toggling */
>   	if (tcpci->data->start_drp_toggling) {
>   		ret = tcpci->data->start_drp_toggling(tcpci, tcpci->data, cc);
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 3c6b0c8e2d3a..6aa62132e69a 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4274,7 +4274,11 @@ static void run_state_machine(struct tcpm_port *port)
>   		ret = tcpm_snk_attach(port);
>   		if (ret < 0)
>   			tcpm_set_state(port, SNK_UNATTACHED, 0);
> -		else
> +		else if (port->port_type == TYPEC_PORT_SRC &&
> +			 port->typec_caps.data == TYPEC_PORT_DRD) {
> +			tcpm_typec_connect(port);
> +			tcpm_log(port, "Keep at SNK_ATTACHED for USB data.");
> +		} else
>   			tcpm_set_state(port, SNK_STARTUP, 0);
>   		break;
>   	case SNK_STARTUP:


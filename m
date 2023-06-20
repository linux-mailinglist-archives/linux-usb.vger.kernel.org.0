Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3F8736655
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jun 2023 10:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231951AbjFTIgO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Jun 2023 04:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbjFTIgN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Jun 2023 04:36:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6464DB
        for <linux-usb@vger.kernel.org>; Tue, 20 Jun 2023 01:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687250132;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=11eS57AQ9fcBiVcbzOhPDQJ5y2r0wA8/LNxfWgVjh8Y=;
        b=UGcrRSzmj+k6abUz9YJyp22MfQUltjb1NQmQrVYQhZ8i2cqwF5P8kdAxivBRUulFzmKBZH
        ezlsfaxy7kYerlj1AubmcNyLFI0KLOoryZhihkMAXaea62RrGItHl2LlUPzykRMhYVEbDR
        7MXzMriYSYucPJrsUeUHGXs6xLcFNUI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-6buuY5-XMXWOO6cfmmEgdg-1; Tue, 20 Jun 2023 04:35:30 -0400
X-MC-Unique: 6buuY5-XMXWOO6cfmmEgdg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-987ffac39e3so195515166b.0
        for <linux-usb@vger.kernel.org>; Tue, 20 Jun 2023 01:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687250129; x=1689842129;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=11eS57AQ9fcBiVcbzOhPDQJ5y2r0wA8/LNxfWgVjh8Y=;
        b=QoM1NRrA9rjRO5LbMCs3MjKzfpZwhzpldodH+9EhbsI0wlOgIcKldM7adke4XiDEwZ
         OMB1linKhKzfc2usF1vIMS2E7RXB3VTomU8xfXMYNu7ike/9dJChvlFJthqzdTO9wBzb
         amuI7YsYlddt2IKCBW+nMzMcFFyoy7WjsKO/VDtoLl50Lcl46NtJfyaWEZXDfYc6dbj8
         vR/r2ShmvQGwi3yw3diEtlIDOKPWydr/DMlDlSZKBjN0PuMCjD1W7oFbeJSoaBapISrA
         alpR4xxKA8nwibxHl+RqHQrGbPZofCJFFwBwrU03wnZRsd/zGJmrJ19HYmMJlvtHSmn1
         fdfw==
X-Gm-Message-State: AC+VfDxlu1UfViUV0KXPHYGcViV82i/sPmj7a79vhfF8lwS0iLkp+NIf
        MObQczynng5qFAlevZ5l8kGafdvhjEe2uq/3crGt27gqAKmJjc3WdW0ocdnZZb3JZ3ybB2q6BHR
        1bGswQCa7dd20u5VFOXNQ
X-Received: by 2002:a17:906:6a04:b0:988:a837:327a with SMTP id qw4-20020a1709066a0400b00988a837327amr3981298ejc.44.1687250129353;
        Tue, 20 Jun 2023 01:35:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4354xb2gPMFjpvypZEuqbjQb11KQs5C1z49lxG8ze9dDtAWxSRfX70X8+MEx7qtEYxIIaLmg==
X-Received: by 2002:a17:906:6a04:b0:988:a837:327a with SMTP id qw4-20020a1709066a0400b00988a837327amr3981286ejc.44.1687250129062;
        Tue, 20 Jun 2023 01:35:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l15-20020a170906230f00b0098807b33996sm930356eja.107.2023.06.20.01.35.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 01:35:28 -0700 (PDT)
Message-ID: <555f01f6-c349-42bb-83da-aead1ef1511d@redhat.com>
Date:   Tue, 20 Jun 2023 10:35:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [EXT] Re: [PATCH] usb: typec: tcpci: allow drp toggling for
 non-drp port
Content-Language: en-US, nl
To:     Xu Yang <xu.yang_2@nxp.com>, Guenter Roeck <linux@roeck-us.net>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>, Zhipeng Wang <zhipeng.wang_1@nxp.com>,
        Faqiang Zhu <faqiang.zhu@nxp.com>
References: <20230608112858.4405-1-xu.yang_2@nxp.com>
 <0330ffea-d258-8fb8-ff89-5ebb0388f1ff@roeck-us.net>
 <DB7PR04MB450545D417BC401B92335F7C8C51A@DB7PR04MB4505.eurprd04.prod.outlook.com>
 <DB7PR04MB45059A20E2474FDCED4C89128C5CA@DB7PR04MB4505.eurprd04.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <DB7PR04MB45059A20E2474FDCED4C89128C5CA@DB7PR04MB4505.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

On 6/20/23 05:10, Xu Yang wrote:
> ++ Hans de Goede
> 
>> -----Original Message-----
>> From: Xu Yang
>> Sent: Friday, June 9, 2023 10:15 AM
>> To: Guenter Roeck <linux@roeck-us.net>; heikki.krogerus@linux.intel.com
>> Cc: gregkh@linuxfoundation.org; dl-linux-imx <linux-imx@nxp.com>; linux-usb@vger.kernel.org; Jun Li <jun.li@nxp.com>;
>> Zhipeng Wang <zhipeng.wang_1@nxp.com>; Faqiang Zhu <faqiang.zhu@nxp.com>
>> Subject: RE: [EXT] Re: [PATCH] usb: typec: tcpci: allow drp toggling for non-drp port
>>
>> Hi Guenter,
>>
>>> -----Original Message-----
>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>>> Sent: Thursday, June 8, 2023 9:24 PM
>>> To: Xu Yang <xu.yang_2@nxp.com>; heikki.krogerus@linux.intel.com
>>> Cc: gregkh@linuxfoundation.org; dl-linux-imx <linux-imx@nxp.com>; linux-usb@vger.kernel.org; Jun Li
>> <jun.li@nxp.com>;
>>> Zhipeng Wang <zhipeng.wang_1@nxp.com>; Faqiang Zhu <faqiang.zhu@nxp.com>
>>> Subject: [EXT] Re: [PATCH] usb: typec: tcpci: allow drp toggling for non-drp port
>>>
>>> Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the
>>> message using the 'Report this email' button
>>>
>>>
>>> On 6/8/23 04:28, Xu Yang wrote:
>>>> Some single power role Type-C port with dual data role, this kind of
>>>> port connects non Type-C port for usb data will need tcpm to work to
>>>> get polarity for orientation change and let Type-C port keep at fake
>>>> power role to provide another non-default data role, so remove the drp
>>>> port condition for now.
>>>>
>>>> Has anyone encountered this use case? How do you handle this limitation
>>>> in current tcpm with a better way? Please kindly share your thoughts.
>>>>
>>>
>>> Have you ? This is an odd comment to make in the patch description.
>>
>> Sorry for this. It's not a formal patch.
>>
>>>
>>> Either case, I don't understand why one would need to enable toggling
>>> under any circumstances if the port is not DRP. The description does
>>> not explain how "need tcpm to work" correlates to enabling toggling on
>>> non-DRP ports.
>>
>> My case is a source-only PD capable port with dual data role, connect to
>> legacy PC host via A-to-C to work as USB device mode. Under current tcpm
>> mechanism, the PC will not recognize the source-only PD capable port and
>> the usb controller has no chance to work as device mode.
>>
>> However, if I enable CC toggling, the PD port can re-work as sink role and
>> the USB controller can function as device mode too. Since it's USB3 port,
>> it can work only after the SS link has correctly established. Thus, we also
>> need tcpm to set correct orientation.
>>
>> So, it seems a limitation to let single power role Type-C port with dual
>> data role to work as non-default data role when connected to non Type-C
>> port.
> 
> I do see below patches from Hans to fix the same issue as ours.
> 
> 48242e30532b ("usb: typec: fusb302: Revert "Resolve fixed power role contract setup"")
> 6258db14d78c ("usb: typec: fusb302: Implement start_toggling for all port-types")
> 7893f9e1c26d ("usb: typec: tcpm: Notify the tcpc to start connection-detection for SRPs")
> 
> So I thinks it's really a limitation for SRP to work correctly with tcpci driver.
> Maybe an improvement is needed for tcpci driver.

Thank you for Cc-ing me. This situation is a bit different from the one fixed by the above patches.

The above patches where for pure single-role ports.

Where as what we seem to have here is a dual-data-role, single-power-role port.

I assume that for this port at least the 5v boost output can be turned on/off. But I guess that it cannot be used to charge the device ?

To me it sounds like that to make this work, even with dumb (just a resistor on 1 Cc line) USB-C - USB-A cables, the port should simply be declared as a dual-role port, because that is wat it actually is (it actually is dual-role).

And then when configured as sink, it can operate in the default device-mode sink data role and just not consume the provided 5V.

Note if the 5V boost output can not be disabled that that would be a problem but that would really be out of spec, you cannot just unconditionally output 5V from a Type-C port.

Regards,

Hans



>>>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>>>> Signed-off-by: Li Jun <jun.li@nxp.com>
>>>> ---
>>>>   drivers/usb/typec/tcpm/tcpci.c | 3 ---
>>>>   drivers/usb/typec/tcpm/tcpm.c  | 6 +++++-
>>>>   2 files changed, 5 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
>>>> index fc708c289a73..88559e749120 100644
>>>> --- a/drivers/usb/typec/tcpm/tcpci.c
>>>> +++ b/drivers/usb/typec/tcpm/tcpci.c
>>>> @@ -175,9 +175,6 @@ static int tcpci_start_toggling(struct tcpc_dev *tcpc,
>>>>       struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
>>>>       unsigned int reg = TCPC_ROLE_CTRL_DRP;
>>>>
>>>> -     if (port_type != TYPEC_PORT_DRP)
>>>> -             return -EOPNOTSUPP;
>>>> -
>>>>       /* Handle vendor drp toggling */
>>>>       if (tcpci->data->start_drp_toggling) {
>>>>               ret = tcpci->data->start_drp_toggling(tcpci, tcpci->data, cc);
>>>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>>>> index 3c6b0c8e2d3a..6aa62132e69a 100644
>>>> --- a/drivers/usb/typec/tcpm/tcpm.c
>>>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>>>> @@ -4274,7 +4274,11 @@ static void run_state_machine(struct tcpm_port *port)
>>>>               ret = tcpm_snk_attach(port);
>>>>               if (ret < 0)
>>>>                       tcpm_set_state(port, SNK_UNATTACHED, 0);
>>>> -             else
>>>> +             else if (port->port_type == TYPEC_PORT_SRC &&
>>>> +                      port->typec_caps.data == TYPEC_PORT_DRD) {
>>>> +                     tcpm_typec_connect(port);
>>>> +                     tcpm_log(port, "Keep at SNK_ATTACHED for USB data.");
>>>> +             } else
>>>>                       tcpm_set_state(port, SNK_STARTUP, 0);
>>>>               break;
>>>>       case SNK_STARTUP:
> 


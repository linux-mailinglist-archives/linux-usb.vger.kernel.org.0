Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C656273687B
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jun 2023 11:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232503AbjFTJ4K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Jun 2023 05:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232502AbjFTJze (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Jun 2023 05:55:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B302738
        for <linux-usb@vger.kernel.org>; Tue, 20 Jun 2023 02:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687254734;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UQtA1ugdvxGAg+9soBiyupHWnwegze8aKE5VKTzwWEo=;
        b=gU7B+PjZA8fvTywLDLu6TjAe41YbaLORwq+nWis4vJoeKfjb09Q97WZESMs7u9akZZJidc
        PBkxtjiWNktUAq8gQTajldXsef6TAf3UkKIBGjoKqBQr1vPkJbWOEVX3mG37cg6vAUm0yg
        OuGtuPsoAUe3zxETG4XrhcJbWO5A5r4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-jceH9e5WNTexumSnCNHTJw-1; Tue, 20 Jun 2023 05:52:12 -0400
X-MC-Unique: jceH9e5WNTexumSnCNHTJw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-514abe67064so3160906a12.0
        for <linux-usb@vger.kernel.org>; Tue, 20 Jun 2023 02:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687254731; x=1689846731;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UQtA1ugdvxGAg+9soBiyupHWnwegze8aKE5VKTzwWEo=;
        b=OxMGP3byRoVuEuPBBAY1IPHBQ0mcMUCfdAcfsb4UCX7Ow6CfZVqsipSiPWP++rOa+u
         lcxAMLNe5xU1/Uel1GAjso7BRbBY48Ql4R5kysm3n7lWCepSVWh/zHcq0BlWjxey+7HV
         sT4zacReC+nstN2u1uNjSx1bdz2J4/G53sBzpWKPJgm27I9N3FxgHGnZQGgm7Xp19NlA
         8bFDl8osAJahrpyxEODhkDsgWSgl4UDs08ExmYjRBBc7eiOt5qDRVBsw6PKMRL0jrHDW
         52PwEdTlPXTXtvpoRroFs6NRShUcmgs4nO17QeiDaRjy0icEaB3+WS3aUKsfCc2xChj1
         98oA==
X-Gm-Message-State: AC+VfDx8IQLHIahQIZSkVi0qaU/h12jH6uyK1nQw6KEMZXRxGZWDn2dS
        vTbhTm7Sd0V1N8ZHkXAgL2JDJXAAq65zgJEnk/J8BRqJsX+Dt502tyH5y35Bm5hRhYFQNpayC8T
        0hKEfXV6xAh99xt/APCt4
X-Received: by 2002:aa7:db49:0:b0:51a:4853:3a0 with SMTP id n9-20020aa7db49000000b0051a485303a0mr5893773edt.25.1687254731015;
        Tue, 20 Jun 2023 02:52:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Q9+W4hmVqCkL+ViYEezxPaahUs3BtcbvpYAXdLAmAhei0Jd1+iLh5wV+5nCP8Kix4R1O+Bw==
X-Received: by 2002:aa7:db49:0:b0:51a:4853:3a0 with SMTP id n9-20020aa7db49000000b0051a485303a0mr5893763edt.25.1687254730741;
        Tue, 20 Jun 2023 02:52:10 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n11-20020aa7db4b000000b0051a595c9fc1sm889439edt.38.2023.06.20.02.52.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 02:52:10 -0700 (PDT)
Message-ID: <1189a9d0-fea5-c725-0c2e-dfe5cf93c7aa@redhat.com>
Date:   Tue, 20 Jun 2023 11:52:09 +0200
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
 <555f01f6-c349-42bb-83da-aead1ef1511d@redhat.com>
 <DB7PR04MB450528B21612C31D1527DAF78C5CA@DB7PR04MB4505.eurprd04.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <DB7PR04MB450528B21612C31D1527DAF78C5CA@DB7PR04MB4505.eurprd04.prod.outlook.com>
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

Hi,

On 6/20/23 11:38, Xu Yang wrote:
> Hi Hans,
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Tuesday, June 20, 2023 4:35 PM
>> To: Xu Yang <xu.yang_2@nxp.com>; Guenter Roeck <linux@roeck-us.net>; heikki.krogerus@linux.intel.com
>> Cc: gregkh@linuxfoundation.org; dl-linux-imx <linux-imx@nxp.com>; linux-usb@vger.kernel.org; Jun Li <jun.li@nxp.com>;
>> Zhipeng Wang <zhipeng.wang_1@nxp.com>; Faqiang Zhu <faqiang.zhu@nxp.com>
>> Subject: Re: [EXT] Re: [PATCH] usb: typec: tcpci: allow drp toggling for non-drp port
>>
>> Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the
>> message using the 'Report this email' button
>>
>>
>> Hi all,
>>
>> On 6/20/23 05:10, Xu Yang wrote:
>>> ++ Hans de Goede
>>>
>>>> -----Original Message-----
>>>> From: Xu Yang
>>>> Sent: Friday, June 9, 2023 10:15 AM
>>>> To: Guenter Roeck <linux@roeck-us.net>; heikki.krogerus@linux.intel.com
>>>> Cc: gregkh@linuxfoundation.org; dl-linux-imx <linux-imx@nxp.com>; linux-usb@vger.kernel.org; Jun Li
>> <jun.li@nxp.com>;
>>>> Zhipeng Wang <zhipeng.wang_1@nxp.com>; Faqiang Zhu <faqiang.zhu@nxp.com>
>>>> Subject: RE: [EXT] Re: [PATCH] usb: typec: tcpci: allow drp toggling for non-drp port
>>>>
>>>> Hi Guenter,
>>>>
>>>>> -----Original Message-----
>>>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>>>>> Sent: Thursday, June 8, 2023 9:24 PM
>>>>> To: Xu Yang <xu.yang_2@nxp.com>; heikki.krogerus@linux.intel.com
>>>>> Cc: gregkh@linuxfoundation.org; dl-linux-imx <linux-imx@nxp.com>; linux-usb@vger.kernel.org; Jun Li
>>>> <jun.li@nxp.com>;
>>>>> Zhipeng Wang <zhipeng.wang_1@nxp.com>; Faqiang Zhu <faqiang.zhu@nxp.com>
>>>>> Subject: [EXT] Re: [PATCH] usb: typec: tcpci: allow drp toggling for non-drp port
>>>>>
>>>>> Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report
>> the
>>>>> message using the 'Report this email' button
>>>>>
>>>>>
>>>>> On 6/8/23 04:28, Xu Yang wrote:
>>>>>> Some single power role Type-C port with dual data role, this kind of
>>>>>> port connects non Type-C port for usb data will need tcpm to work to
>>>>>> get polarity for orientation change and let Type-C port keep at fake
>>>>>> power role to provide another non-default data role, so remove the drp
>>>>>> port condition for now.
>>>>>>
>>>>>> Has anyone encountered this use case? How do you handle this limitation
>>>>>> in current tcpm with a better way? Please kindly share your thoughts.
>>>>>>
>>>>>
>>>>> Have you ? This is an odd comment to make in the patch description.
>>>>
>>>> Sorry for this. It's not a formal patch.
>>>>
>>>>>
>>>>> Either case, I don't understand why one would need to enable toggling
>>>>> under any circumstances if the port is not DRP. The description does
>>>>> not explain how "need tcpm to work" correlates to enabling toggling on
>>>>> non-DRP ports.
>>>>
>>>> My case is a source-only PD capable port with dual data role, connect to
>>>> legacy PC host via A-to-C to work as USB device mode. Under current tcpm
>>>> mechanism, the PC will not recognize the source-only PD capable port and
>>>> the usb controller has no chance to work as device mode.
>>>>
>>>> However, if I enable CC toggling, the PD port can re-work as sink role and
>>>> the USB controller can function as device mode too. Since it's USB3 port,
>>>> it can work only after the SS link has correctly established. Thus, we also
>>>> need tcpm to set correct orientation.
>>>>
>>>> So, it seems a limitation to let single power role Type-C port with dual
>>>> data role to work as non-default data role when connected to non Type-C
>>>> port.
>>>
>>> I do see below patches from Hans to fix the same issue as ours.
>>>
>>> 48242e30532b ("usb: typec: fusb302: Revert "Resolve fixed power role contract setup"")
>>> 6258db14d78c ("usb: typec: fusb302: Implement start_toggling for all port-types")
>>> 7893f9e1c26d ("usb: typec: tcpm: Notify the tcpc to start connection-detection for SRPs")
>>>
>>> So I thinks it's really a limitation for SRP to work correctly with tcpci driver.
>>> Maybe an improvement is needed for tcpci driver.
>>
>> Thank you for Cc-ing me. This situation is a bit different from the one fixed by the above patches.
>>
>> The above patches where for pure single-role ports.
>>
>> Where as what we seem to have here is a dual-data-role, single-power-role port.
>>
>> I assume that for this port at least the 5v boost output can be turned on/off. But I guess that it cannot be used to charge
>> the device ?
>>
>> To me it sounds like that to make this work, even with dumb (just a resistor on 1 Cc line) USB-C - USB-A cables, the port
>> should simply be declared as a dual-role port, because that is wat it actually is (it actually is dual-role).
>>
>> And then when configured as sink, it can operate in the default device-mode sink data role and just not consume the
>> provided 5V.
>>
>> Note if the 5V boost output can not be disabled that that would be a problem but that would really be out of spec, you
>> cannot just unconditionally output 5V from a Type-C port.
> 
> Thanks for your comments.
> 
> I looked through your patches in detail. It seems that your issue is the
> TOGDONE interrupt cannot be asserted even the default CC termination is
> set for SRP when Type-C cable attached. The reason is a step to enable
> SNK or SRC Toggle autonomous functionality is missed. When this step is
> added, TOGDONE interrupt will come as expected. However, it has issue to
> put this step to tcpm_set_cc() when doing power role swap. So your case
> should be a different issue from mine.
> 
> Yes, the 5V output from source-only port can be turned on/off. The tcpc
> does support dual power role. But subject to our usecase, we need to 
> restrict it to be a source-only port with below properties and avoid sinking
> vbus via hw design:
> 
> power-role = "source";
> data-role = "dual"; 
> 
> So I think this is a normal usecase. The software might need to make a
> little change to support it.

Right, but in order to be able to use device-mode with a passive
USB-C <-> USB-A cable your tcpc still needs to use dual-role toggling,
otherwise it will not even generate an IRQ when plugging in the
passive USB-C <-> USB-A cable and you thus will not even get
an insertion event.

Which I see is more or less what your original patch tries to do.

So I guess your original patch does seem to be something like
what is necessary but for the UCSI bit it should be limited to
only still allow dual-role toggling when the data-role is "dual".

Also it should be split into separate patches for the UCSI
and TCPM parts.

Note I've not looked at the TCPM part of the patch in detail,
I'm not sure that part is correct.

Regards,

Hans




>>>>>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>>>>>> Signed-off-by: Li Jun <jun.li@nxp.com>
>>>>>> ---
>>>>>>   drivers/usb/typec/tcpm/tcpci.c | 3 ---
>>>>>>   drivers/usb/typec/tcpm/tcpm.c  | 6 +++++-
>>>>>>   2 files changed, 5 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
>>>>>> index fc708c289a73..88559e749120 100644
>>>>>> --- a/drivers/usb/typec/tcpm/tcpci.c
>>>>>> +++ b/drivers/usb/typec/tcpm/tcpci.c
>>>>>> @@ -175,9 +175,6 @@ static int tcpci_start_toggling(struct tcpc_dev *tcpc,
>>>>>>       struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
>>>>>>       unsigned int reg = TCPC_ROLE_CTRL_DRP;
>>>>>>
>>>>>> -     if (port_type != TYPEC_PORT_DRP)
>>>>>> -             return -EOPNOTSUPP;
>>>>>> -
>>>>>>       /* Handle vendor drp toggling */
>>>>>>       if (tcpci->data->start_drp_toggling) {
>>>>>>               ret = tcpci->data->start_drp_toggling(tcpci, tcpci->data, cc);
>>>>>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>>>>>> index 3c6b0c8e2d3a..6aa62132e69a 100644
>>>>>> --- a/drivers/usb/typec/tcpm/tcpm.c
>>>>>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>>>>>> @@ -4274,7 +4274,11 @@ static void run_state_machine(struct tcpm_port *port)
>>>>>>               ret = tcpm_snk_attach(port);
>>>>>>               if (ret < 0)
>>>>>>                       tcpm_set_state(port, SNK_UNATTACHED, 0);
>>>>>> -             else
>>>>>> +             else if (port->port_type == TYPEC_PORT_SRC &&
>>>>>> +                      port->typec_caps.data == TYPEC_PORT_DRD) {
>>>>>> +                     tcpm_typec_connect(port);
>>>>>> +                     tcpm_log(port, "Keep at SNK_ATTACHED for USB data.");
>>>>>> +             } else
>>>>>>                       tcpm_set_state(port, SNK_STARTUP, 0);
>>>>>>               break;
>>>>>>       case SNK_STARTUP:
>>>
> 


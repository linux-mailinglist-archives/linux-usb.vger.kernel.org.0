Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E26C680B55
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 11:53:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235907AbjA3KxO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 05:53:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235575AbjA3KxN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 05:53:13 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC5B13D60
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 02:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.at; s=s31663417;
        t=1675075984; bh=2jfpMBagZaGgDG8RBKN6VHWmQCjG4MeLyw0BAmxvHpg=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=R3zUJ551Y9ptEZhKxA3Y31JH0vlkmOaMre1fCIW5ExRnx/X4TMQ8T5ZKTVy3D1ejX
         iZ9zH+Kkz742AnMy3Fjr+VRoiCCmdVc6ByuEMrThCHJZ4lHmJEEXxFF4v3NF4fBsvH
         hLXOm5a1yiG7My2DmdjWD11fvXvS+rEhb/3ZmdxjHPpuoNn2NCqXd9oAJWDEzc9W+Z
         tf/38PRiALuMiCmXIfqEzbfcyETc0VMxJiibudVEoIi94YkrPmjBbynIqzMTspA0Oc
         Wy5RTIHywTo0cx8DdXsTIqcnyZ4+Xq50un1LzSc4/Rxte8fwNtsIne7C//cV63ri49
         NSOFA0PVROYKg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.70] ([81.189.232.75]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCsQ4-1pVDE00rke-008t5V; Mon, 30
 Jan 2023 11:53:04 +0100
Message-ID: <47af73e9-0d3f-0ac2-52e6-b89a87bc602b@gmx.at>
Date:   Mon, 30 Jan 2023 11:52:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Possible problem with thunderbolt 4
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
References: <057da4af-9507-fdc6-9588-160a88210674@gmx.at>
 <Y7wNnrlEWMOV4Cj/@black.fi.intel.com>
 <0f862f75-9805-f5d0-ef89-0b77d0ae8778@gmx.at>
 <Y72AbwKFd9snjZrJ@black.fi.intel.com>
 <3ccb150b-dbd9-c9d0-0e8c-8c169f0d8faf@gmx.at>
 <Y76TS54PJpmseZs3@black.fi.intel.com>
 <8c2da730-ba9b-6ec7-d493-1a6a2ce54622@gmx.at>
 <Y8kXFFrue7l7DKf3@black.fi.intel.com>
 <78c5218a-67ef-d61d-09fe-2c2cf7fdc87f@gmx.at>
 <0c9e644e-a07d-e9bb-f8d6-692d2412fd30@gmx.at>
 <Y9PDRYHHYNSJWwGe@black.fi.intel.com>
Content-Language: en-US
From:   =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>
In-Reply-To: <Y9PDRYHHYNSJWwGe@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:S32kNS3NBOaGvK+gW8K0eNiWpv9P0YVGbhBORREQnTxaXOALmii
 4tjti9oM9RMIXVuiOxFOC4l+RShola/0HnELrwce3D1KcoNCXOTKMQXaesfnnJhKQLbkKm/
 RaOtZNSUNWW4QFmSN4q5UnJ1df/yO0D2iqTXSDdMHnOklTONSzLBNeZiJ3fAloH4ppE3RHl
 vbZWX+lIjUw2rtKt2Z+1Q==
UI-OutboundReport: notjunk:1;M01:P0:JnjV3/9Uw3M=;3nYRpYZvdLGJZ5m/OxJy/F23P67
 NHKN/XNjRWU55Gr2Gxwmak1e2L1/REz1JmmgmzaSOMQLveAGYKZrrqGk1zzsD2kiS9OGA9iNj
 NxFdCQcOxOM3VC4OGl7FnUrgfiTYzrn2KfQOsmpz/fcjhCicpEDN6q/wrArwg5Np8OYfTHQ+s
 +uOvFfG0MvfNP3AnvzvDGdwJ44bkbI/DmueHm0gDp3uoSbQVNilvV3AjggAJrIn8n1ngDcKs4
 VPJSK7Kz3VGWRxz0mTHslRed5cSgdUcBplXUnCFmiWeZmp+txEDlrbxDgKhw2Y3Ar/my7Sjyh
 ZXPpbmi/7LjTAt2r7rOWyuIG5jdgfiH5SaWMFZkdt5y7ZOGuMsGwtnmLtppq1zQTzOP7SvDvE
 Or9S04Wsz1Q4MN1HZsJxytzdXUga3NSTM06jbjQ8akTDSzQAIOzj9X/vXrGzL71tl8NInwq9e
 SU2qF9Pz3iPjDrxkJNOqk284sH+MGK3TbY1N0vG0EiGYUu2+b8EJ4hP7z+0MNaIcY3+6mfmtV
 RMJxHPtxzJxQAjPHPR1/+WWNbs3TU9VRbojDoIftG0HUnWKlPW7KXGwBILRmdWhmG1GBp5w6U
 UlhU2rDKbj4gCJoqZTnc6LUrBl7Z5F/KMBZ/O58p80Zcmj8ZwP/72F+NYOEb7CKFfLtxzlVav
 sLURkNGsNZnLqFeiuroiyEx0yDbNj1njC/jPIMhe2M+28pI4n8PIgeLfavFHkk/yluJ6yC6oK
 3jWprAjTx+4rxog7q2NZpao7aDVwVKxXR2f7U89X1C8Q3vdDjQTmAbTU2nOOPHxBO2E0m9iz9
 zr4kL8LMQzBSC50AmafpP+O9qVvBqBHZfrf4WhZXY3NCSL4a47dz8/HW1BdTwNO9Uv4s62eqX
 oJUCiZvMVJGo/9b2bXtt0dT07XzHQNo5OnB3Oqs97kclrOIxLdgegZzmqYoK5wzakGG39Ke0e
 Jx+eoQ==
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Am 27.01.23 um 13:27 schrieb Mika Westerberg:
> Yeah, I just got report from the folks and unfortunately we were not
> able to reproduce the issue in the lab. The PCIe tunnel stays up (or
> gets re-created) after reboot from Linux and is visible in the UEFI
> shell (so in the BIOS).
>
> So at the moment I'm out of ideas why this happens since Windows flows
> should be the same. And we have no means to repro it locally to
> investigate further :/

Ok. I try to get access to some more TB4 devices. Currently I have two (HP=
, Lenovo) that show the issue when the software connection manager is used=
.

>> Another thought of mine was, if it wouldn't it be useful to have a kern=
el commandline switch (or thunderbolt module option) that allows the user =
to select whether the software connection manager should be used, or the f=
irmware connection manager (if avialable)? I understand that in general us=
ing the sw connection manager is favorable because the OS then has control=
 over the connection, but maybe there are use cases where letting the firm=
ware doing the job is just fine (like in my case ;-)
> Right, we may add one but I think it should be part of the USB4 _OSC
> negotiation like the below patch (acpi.native_usb4_disable=3D1 in the
> command line should switch to FW CM). We could also make it "automatic"
> by adding a DMI quirks table that then sets this.
>
> diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
> index 0c05ccde1f7a..7da4d56fb936 100644
> --- a/drivers/acpi/bus.c
> +++ b/drivers/acpi/bus.c
> @@ -296,6 +296,9 @@ EXPORT_SYMBOL_GPL(osc_cpc_flexible_adr_space_confirm=
ed);
>  /*
>   * ACPI 6.4 Operating System Capabilities for USB.
>   */
> +bool native_usb4_disable;
> +module_param(native_usb4_disable, bool, 0644);
> +
>  bool osc_sb_native_usb4_support_confirmed;
>  EXPORT_SYMBOL_GPL(osc_sb_native_usb4_support_confirmed);
>
> @@ -344,7 +347,7 @@ static void acpi_bus_osc_negotiate_platform_control(=
void)
>  	if (IS_ENABLED(CONFIG_SCHED_MC_PRIO))
>  		capbuf[OSC_SUPPORT_DWORD] |=3D OSC_SB_CPC_DIVERSE_HIGH_SUPPORT;
>
> -	if (IS_ENABLED(CONFIG_USB4))
> +	if (IS_ENABLED(CONFIG_USB4) && !native_usb4_disable)
>  		capbuf[OSC_SUPPORT_DWORD] |=3D OSC_SB_NATIVE_USB4_SUPPORT;
>
>  	if (!ghes_disable)
That works fine on the HP, with that active the firmware connection manger=
 is used! To make it 'automatic' would mean that on machines listed in thi=
s new DMI quirks table the software connection manager would be disabled, =
correct?

Regards,
Christian



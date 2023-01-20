Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4B85675356
	for <lists+linux-usb@lfdr.de>; Fri, 20 Jan 2023 12:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjATLUx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Jan 2023 06:20:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjATLUx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Jan 2023 06:20:53 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D64DCDE3
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 03:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.at; s=s31663417;
        t=1674213644; bh=KHtQaHegBJkPK61zCaHRsr32rVEkOy4oVVYnqL4LRKk=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=e4nLpXmNvJi9VMzP2jegl3/lBmuy4ZXdy+XqpRuTqhG+7Rn7Vlad9JTRanh82vdkj
         57oxZ0sYdMFTEjVAF/N43yKcZG9Y1+kYP50ktUi69K4c0xMnMBsHIJO5rt+kb/m+yE
         2N0xqhg+fgcQ8hOfVl3Pi9SFXQALpLKfXB57K0+wqTkszNKNSbrs3M4bIYRzeI40lC
         yPKZs+v7xM2Z+8G/eHBHnRsKa/D705+9UOZY8xUEzbZQzWjA2grtqNzQtgaN7vFr6R
         shrj7EgvmhCWxjvqLpmTsHUKxkqQxikuqWkr2ndi/lAf6szm8IQsDwQj89RMSeYg5+
         +JXV+v6YCQ4bw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.70] ([81.189.232.75]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M26vB-1pGtVN0ixF-002YX9; Fri, 20
 Jan 2023 12:20:44 +0100
Message-ID: <6edd3033-b22b-a293-82e8-10594526ab44@gmx.at>
Date:   Fri, 20 Jan 2023 12:19:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Possible problem with thunderbolt 4
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
References: <Y7UzCY6ujQ2qtoq5@black.fi.intel.com>
 <057da4af-9507-fdc6-9588-160a88210674@gmx.at>
 <Y7wNnrlEWMOV4Cj/@black.fi.intel.com>
 <0f862f75-9805-f5d0-ef89-0b77d0ae8778@gmx.at>
 <Y72AbwKFd9snjZrJ@black.fi.intel.com>
 <3ccb150b-dbd9-c9d0-0e8c-8c169f0d8faf@gmx.at>
 <Y76TS54PJpmseZs3@black.fi.intel.com>
 <8c2da730-ba9b-6ec7-d493-1a6a2ce54622@gmx.at>
 <Y8kXFFrue7l7DKf3@black.fi.intel.com>
 <78c5218a-67ef-d61d-09fe-2c2cf7fdc87f@gmx.at>
 <Y8ppf5HHTOaDfGLq@black.fi.intel.com>
From:   =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>
In-Reply-To: <Y8ppf5HHTOaDfGLq@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zN+gNilndbhpzX2pqk7EdciNaalbo6oeYfk0IqqkrzWHn1FVXv+
 fjRG1ctV1a/jylRac4CSUK0iLGV7LVfa/bwtvQ4crxxdGbdu/Ueir4OwCBkGkCtZcToqsPd
 R8MWZEWIcTzYYQzcpXMuImvdmsFYjm/45mrGfDHyXW1Jnv4aSTr6Du7PKQL0lPEsnGwmSXv
 wDNVGzXYJvM4i1GSR2G7Q==
UI-OutboundReport: notjunk:1;M01:P0:gaK9K1N3kho=;zmU35TbC9TPKT5dbmbahHKnDHOo
 b2ElxVfK86fPsU03690CRmLlSMvI2ZgrSyMyvj1LQSuUmmrfXyOSQZYWU9N6kvnA5YztO2wa/
 dgCmqq/jc+7hPu0NyaDDjwlqIdRKqTLDhzLLqJlJ646igZVemLre/4kc+MHBldfsBjag46jtg
 cdiKpDThEIP0MHgmxeX2QpEdHLP4Ww7/ym0qA3G8NCVpMZGbOdTzgK5FYe6Ol4Yn9pIsOfqOo
 H3wtIQlx2ArGeovm12iAPE8g9MfObM9AureHwciLu7T5KQDHC7Jn0jJ4EGyj22NnHnJIoz2Np
 2my4p1ZIZDO3sO3JHEtvgTSDVi01BZwDIsYNiyjHpfi9ON9YfOFNlhKolvAUsthZygd2vFxZa
 6OJfBLSOLlIv/MWxSgyQU1oY+3o+jZXJ+iIIzMejBBgt77HaDAs4agl4d/Wd+5a9BHDUfKwq2
 kzdzpC2lOyG7KZGp56iofAfb/gFfOOox7Ss43J2qQFrlmLdbIO3n1W442Jp3BJMSHsYnzbkKY
 3+HKRzTzFxV2UTbzpsvuB5WORT1eoAUyWlmnL5xSlTYb7gJa5taYAH3U/C2hDe1e2c5483Pz9
 SnGTHH5+dfnuPs3IcKJ6UXqnSoCm+xDoD2e94XiRfZxanydtCLAq4yVDclHixugEdbMvu68sc
 BJnZghHz3IPDP45FvDbXIjCknad/40FCg3MFgto0odjKydYAHSPT8BC0XlM3haAgz0f4AaJqt
 AzwuJNRJyno5JBVHFKrbpQowadWZPDyXJiKSo06WEWHS4Zz5qCpAAgFISJjBI/dPkZJHl4xjP
 PxiXlN+QD72ogKY42oqOcOx33uziPJDjK59JNcQOZgxYQswAk1ZfyHnbzHMHeAGuvzH5AxFTV
 pvqyztKuBejnAdxOlWZw7x128t2Ajy2l6HUHgxgbevezGeMetb1VINUjGVvV8fRtvRMJsFEHa
 zlKVE9uOpodshsfK0wMC4XfYU9w=
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
>> You're right! With this commit reverted it uses the software connection=
 manager, with the commit applied it uses the firmware connection manager.
> Hmm, so reverting this commit enables software connection manager and
> makes the Lenovo system work? Are you sure? that's completely opposite
> how the HP system behaves ;-)

No, with the software CM active it does _not_ work! The patch introduced i=
n 5.18.11 somehow prevents the software CM to be used...

5.18.9, without the comit:

bash-5.0# uname -r
5.18.9-superschaf-uefi-bisect
bash-5.0# dmesg |grep manager
[=C2=A0=C2=A0=C2=A0 2.028144] thunderbolt 0000:00:0d.2: using software con=
nection manager
[=C2=A0=C2=A0=C2=A0 2.220380] thunderbolt 0000:00:0d.3: using software con=
nection manager

and 5.18.11, including the commit:

bash-5.0# uname -r
5.18.11-superschaf-uefi-bisect
bash-5.0# dmesg | grep manager
[=C2=A0=C2=A0=C2=A0 1.827993] thunderbolt 0000:00:0d.2: using firmware con=
nection manager
[=C2=A0=C2=A0=C2=A0 2.113706] thunderbolt 0000:00:0d.3: using firmware con=
nection manager

On the HP the software CM is used always (unless I run a kernel with CONFI=
G_USB4=3Dn).

Regards,
Christian


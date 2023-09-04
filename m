Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB5267914C4
	for <lists+linux-usb@lfdr.de>; Mon,  4 Sep 2023 11:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245366AbjIDJbV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Sep 2023 05:31:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236258AbjIDJbT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Sep 2023 05:31:19 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94741C4
        for <linux-usb@vger.kernel.org>; Mon,  4 Sep 2023 02:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.at;
 s=s31663417; t=1693819870; x=1694424670;
 i=christian.schaubschlaeger@gmx.at;
 bh=OjY/e8cUu6KychhrtQduEhYrgv0LC9t+Uogof78gwuo=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=RtAps4uEXNrRmlbwQVF2TZPD6aIGKn6Z5BywgkGfbhDO3rwp+HMugwTpdlC/TE9EGzoB6un
 d2+ht/RYPln5M2NMagPBVyLggXbd+1zsriftyc5BIZ+1KRMFcA/oF66UtN3s4x+wYM91Nug5a
 0kZnZnYsrDmbrnwlrJccJRo7sFR1bMHxrMFWbD6o7NYjNoN1pBaNKv9pPNGTsXlxtubabCchH
 Lkr8IbNyHW9/1VXedb/CPl+4KnDXCVDge4fnIO5rgARiE6U1biIm4gljBlcwGGbPLry+vUuXW
 8Zg3HD72d0NenmOoollJqY9kIc3f9/2+dyB0qNv8CXVePVMu47TA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.70] ([88.116.17.66]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2V4P-1pemNF0nbr-013t9X; Mon, 04
 Sep 2023 11:31:10 +0200
Message-ID: <8c67d46b-38f3-dc62-df8f-bc6d7737787c@gmx.at>
Date:   Mon, 4 Sep 2023 11:31:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: USB issue on a TB4 controller?
From:   =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <a45b9989-c9da-bf4e-94c8-3e1341777b4d@gmx.at>
 <20230526123655.GW45886@black.fi.intel.com>
 <0bbb844d-3348-dc28-311a-d4111f8a7f81@linux.intel.com>
 <2d12af30-4a7c-5fb3-fab8-5759296c68ac@gmx.at>
 <20230530105039.GF45886@black.fi.intel.com>
 <d6e7e0d5-0b30-d66c-2ee8-4f0c0caef0b9@gmx.at>
 <20230530121756.GG45886@black.fi.intel.com>
 <a22f8874-c2b3-92a5-e858-b877872e5284@gmx.at>
 <894ba559-9233-4428-69e7-7c0bf5c7556e@gmx.at>
 <b45b5e8a-756e-fd76-64af-d3e376997a31@linux.intel.com>
 <618d9789-fc5a-10b3-6dc9-27be5bbff666@gmx.at>
 <dd62787f-a04c-01ce-6a16-6a116f0f9c3b@linux.intel.com>
 <36d37597-c0fb-cbaa-dd7c-0f3d6b4050c1@gmx.at>
 <8b96cd69-324a-8f9e-fcd2-4681a43c2020@linux.intel.com>
 <5bc24e26-ae55-3c8f-ea5b-6be7ebbcf957@gmx.at>
Content-Language: en-US
In-Reply-To: <5bc24e26-ae55-3c8f-ea5b-6be7ebbcf957@gmx.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zBxeu49Pwdk86WxHWgYG1oF7fKyAr7P6yEDrHdkDnzwRuquqOv4
 yzi7zsUf2xsG3bHGINEJMWYl6hiTiDDL5NZEpZjOOjSah8N5SDonRd1lJ4iFQ+zrZCNOTJM
 6WVykm8z3DRyyXr+oBYitfwXWwXIMZcZWTTerhXrBqYfpMecMSmQU6uZZvsaDOhdphRoytX
 18rtIycWl2xulo5Fu6vUQ==
UI-OutboundReport: notjunk:1;M01:P0:exgvN4TbfHg=;k0eWpL9S54cddjhLf4zMdZKlVbb
 DBwFthXQUu80JAoK8KK0eTzh3SSZk0N0ObznFaUotikMSWF3YoB5UgVK/oY7UOs6vIobZGnGj
 mFMgoCcRkCSc9fDfUTFRxJ+4wMX7nf8K5d426HXHCT+yOfh1x5nj4nVl2+XzPbfeZ/uUDX8Km
 p58ziDBI6JUNY9SA6keVtPHoLPy/v4Q6sOYYLF7OzWmwA+aMj0RLTEfGb4pNT3ClgtsgnkmiU
 4QLhPU9h+EESbjge73cKrcTiONAVdNSh3qgQD4uHU6+4YX0mQOFLuhfGuOlh5JMNGFOYZVRx4
 o1EsTbMtwUZZN/NO4Bw6Lw3QtJfoqyfyeHV+W2fRan36ELXytlnps5sj6qk1utgXgTJlyjTQL
 nbKEtJZFTuaemJCnbD8ghklG7Sq/xk6xXz2OnboisbQm6QZsnnvLRNcxEhunNDOJIavsptKXf
 qnKi1DqPFu3am+AxoaRSIME9x/M+nwMUBhUVPVViCAgJbzRUcQdb0QCSEJM6xnTKsVHwkXvz8
 BBQhboulSMxhjMkzw0Tw6vM/CB5q3TGBuD6hG+NlgHCWoDQAhP1qgwYIMwUOUXb3d3UF8jC4E
 zj5czRiTZ7AS0pdkVMQBOlwjWVWu4C7gr9+G+sJ3xqcUzLq6Ls7ofjyk5S1pIFNtrFBSl1SpF
 ovR+0mJBiOepiIJ+tHJ6LAKqa+c5Vv2G4W+v9fqOKlfjVxY9MujA2nMTZaHAdYgT0LGkYjDWs
 pnFvQy5M028pER+SoFU3GHy5+VZNDq+Cy7lasmYBaCuLnNsI1mg5csFJEN30KRn/1eHWf9Xq1
 WjSqmJmEz89CtLrVLUQ+48RrOKoGa7pYdPH0Tt4yBS15ENVqLEV1gAmLmICTZR3dNwDbYz9Bc
 rUKskFbOylip0chacs5B7R4nbfPEF0ybuSDGU8YjS0OKGFH+W776o+WlPZkwwFsgEzmAJNfee
 tlIaeQ==
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I wanted to ask again if I could provide any useful support on this matter=
.

Thanks and best regards,
Christian


Am 16.08.23 um 09:13 schrieb Christian Schaubschl=C3=A4ger:
> Hello,
>
>> I have to check if we have similar machines and docks laying around.
>> I'm away until August so there will be some delay on my side
> I just want to ask, if you could find any machines / docks for testing t=
his. Today I could reproduce the issue with a 6.5.0-rc6 kernel, also with =
the lastest Ubuntu-22.04.03 which comes with a 6.2 kernel. As I said befor=
e, if you need any logs or tests, I'd be happy to help debugging this.
>
> Thanks and best regards,
> Christian
>


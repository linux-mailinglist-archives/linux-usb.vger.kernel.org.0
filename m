Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5248B665929
	for <lists+linux-usb@lfdr.de>; Wed, 11 Jan 2023 11:39:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236837AbjAKKja (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Jan 2023 05:39:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238563AbjAKKj1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Jan 2023 05:39:27 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5029E60C4
        for <linux-usb@vger.kernel.org>; Wed, 11 Jan 2023 02:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.at; s=s31663417;
        t=1673433558; bh=vmi3Y3jCmFRioYguExYp8IbvmRsnJY/5rx+xg6EE3LA=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=tTfqrFPsR2cAwc9v4OaldCM/c5HtJQFzOGs8fyqcO5BoyzEBegMuqInRwwOylt/iP
         iBuKipd87/Gs1Hkms9LsfbtWBULrwa153RtY3/m61IFVcnn0kjRaDEXcoTHF8wR4/+
         RLgcIxgxOkHR0Y251f+By/daWzTzYXEclUxboDwJrgqPD872aNfv7r2JumjS9SI749
         ds04hBUTGl+0mpKSXHwT6/UoiX/gnlEeHue1y1Fh9AMNffvd59whiS2ySQpnDdAtcB
         ECbNAmO0EmEjYIm9ZlFIdUl9Zqp9JWYrRijwjLMIx7JfyZYXsPgo/MJGo34qW9ymtD
         OxI10apT0QSpA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.70] ([81.189.232.75]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4zAy-1oo1iM1IZg-010wJu; Wed, 11
 Jan 2023 11:39:18 +0100
Message-ID: <3ccb150b-dbd9-c9d0-0e8c-8c169f0d8faf@gmx.at>
Date:   Wed, 11 Jan 2023 11:38:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Possible problem with thunderbolt 4
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
References: <Y7ME7EwduIQE38+2@black.fi.intel.com>
 <a324ff2a-d014-83d2-4f30-b865db7c352b@gmx.at>
 <Y7QMlV82mtaApJwJ@black.fi.intel.com>
 <a8c1dd4b-7227-5ba2-97a4-a2dc3d561ea3@gmx.at>
 <Y7RSrLYfG1r8b+Zj@black.fi.intel.com>
 <86a6b7ca-4302-00fe-97f6-d48ebb5e6171@gmx.at>
 <Y7UzCY6ujQ2qtoq5@black.fi.intel.com>
 <057da4af-9507-fdc6-9588-160a88210674@gmx.at>
 <Y7wNnrlEWMOV4Cj/@black.fi.intel.com>
 <0f862f75-9805-f5d0-ef89-0b77d0ae8778@gmx.at>
 <Y72AbwKFd9snjZrJ@black.fi.intel.com>
Content-Language: en-US
From:   =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>
In-Reply-To: <Y72AbwKFd9snjZrJ@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:nYdb5x7eCqn2/ybqyDCf/YD5CHF1QytsF0u+gsWDnudBQ+cpmCz
 EKwc9xZD1/3+sXIPwXUoeVk2LpHwz8zytqK17Uu8dCbdekGorfkP4fNBTIvaPwC1nDgw8eN
 MXHrTf8vdUKZmYDxfnz0oWqGm1aCf0FPmO0i6o/7dO53gPxksYl5EYkaZlrEaI82CmbSaw1
 bUz8YioceKsBgjX8EOqzw==
UI-OutboundReport: notjunk:1;M01:P0:B+VQ+UUO8FE=;wbw3fcMeD0jKC7rs5qPVHH/liK0
 KBUpMVapmHr70EZz0TiHMzPG3CDa2y0xSxF+M/nnFrz2XPkuBpitrgGqn07WHP7JbHoWMEZZ9
 jhZ65Gg+I+vmjk0HQVrARzfEe/imux3hG2cp93KEb4ml/bkvnKDkhOlyAg2TwKH9kk1EVTV/P
 lSY526cqlj9Q1ez5dG/yq0KVQZonGx3myKEodLUYVBOBok2eYkU+tBqSgmrey69X/L7ET+UOL
 p+Ymy2V6LfVOnV25CylZQt0xAA30Uy0SKT1VNktL+V3zoIvPYjgr7b8S6oapXVRKKwZWQiRKY
 dY4sLsAEBWfk3cLPovkYK1AGM32ve91x4MreJqZiiNbOt/OpY5v2hzJ6wrBLVOnw5pi5HrIWu
 i6sg3fXa+dZACvC1dkr6bJ+OYvWD5r33ulhjfoFodo6tgNEu+1/asSi2H7yFZkV6qpe9ALv3A
 V7AM7wRdmMVMGT5VViG0ELg5LWA/Mn7RcSPYVr+SR5UE79E/syiFPRaOfIeN+G8RnMnLRedRH
 jea5IH7xO0gRms0VsZ+pxIcqtA8BsJxBUfrLJgxf690XPylx6+AvAtPzDhOSSj8siwK/0cKlq
 DI5YwMxiCiAzrvEXyv3JoFq4hRQuYwAUiVhnHCEm3EXjZJPf1bqqxHB3wnEMWNxZOiJMwhIDv
 BN6C6T2qq8EjL1wa3iEyW/fKtNtyvvCOTnoQ1JbmKHKe8R35uJz6r75DlJHfP9HjCu7C3XqXd
 mJ6NvAkAsVqw+4fKQVAJDzVEg2NUdtFB0G3b5Nq6FInpYBexECcviPZYd3HZfhqdQNQpcDuT+
 7Ss27cYrMqXZoyVqkEZIZ0e5N8Cji0no+sVD0t2G5kjJAfdXPQcraYcIervURvWUCxt5mXyvK
 MLqbJVxBxzdrBSHUs5d7Re/wnvGeBFS6IgbC5XWwvNEjPWsh2XKYNu4xMk/eMqOIOqtbmUsvN
 s2Q83CD7mcQCuqsHHb8bcZE0QtU=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
> Okay thanks for checking. I'm discussing with our Windows folks if there
> is something done differently in Windows side. They do similar reset in
> certain flows but I'm not sure if it is exactly on "reboot" and it is
> not clear whether Windows and Linux "reboot" in general is doing the
> same thing either.
>
> In the meantime, did we try this already?
>
> 0. Drop all kernel changes
> 1. Boot the system up, nothing connected
> 2. Plug in the dock
> 3. Check that it works (lspci etc.)
> 4. Unload the Thunderbolt driver
>
>   # rmmod thunderbolt
>
> 5. Reboot the system

I think we did not try this one so far. But I did now -> same result...

What I _did_ find out is this: if I disable ACPI on the kernel command line (acpi=off), things work fine. I can even boot with the dock unplugged, then plug it when linux is up, and it works in linux, and also after the reboot in the firmware!

Of course switching off ACPI is not a real option... but maybe this brings some light into the dark...

Regards,
Christian


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8129E5721B6
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jul 2022 19:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232387AbiGLR1J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jul 2022 13:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbiGLR1I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jul 2022 13:27:08 -0400
Received: from re-prd-fep-044.btinternet.com (mailomta4-re.btinternet.com [213.120.69.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB6DABF564
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 10:27:06 -0700 (PDT)
Received: from re-prd-rgout-003.btmx-prd.synchronoss.net ([10.2.54.6])
          by re-prd-fep-044.btinternet.com with ESMTP
          id <20220712172704.DWBL3224.re-prd-fep-044.btinternet.com@re-prd-rgout-003.btmx-prd.synchronoss.net>;
          Tue, 12 Jul 2022 18:27:04 +0100
Authentication-Results: btinternet.com;
    auth=pass (LOGIN) smtp.auth=flitspace1@btinternet.com;
    bimi=skipped
X-SNCR-Rigid: 61A69BAC23288EBB
X-Originating-IP: [109.154.100.71]
X-OWM-Source-IP: 109.154.100.71 (GB)
X-OWM-Env-Sender: flitspace1@btinternet.com
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvfedrudejhedguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceutffkvffkuffjvffgnffgvefqofdpqfgfvfenuceurghilhhouhhtmecufedtudenucenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpeftohgsucfrvggrrhgtvgcuoehrohgssehflhhithhsphgrtggvrdhorhhgrdhukheqnecuggftrfgrthhtvghrnhepleeiteeffedvgfegtdfgjeekhefghfehtefftdfggffhgfdthfehieetvedtjeeinecukfhppedutdelrdduheegrddutddtrdejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopehflhhithhsphgrtggvrdhorhhgrdhukhdpihhnvghtpedutdelrdduheegrddutddtrdejuddpmhgrihhlfhhrohhmpehrohgssehflhhithhsphgrtggvrdhorhhgrdhukhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehkrggsvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from flitspace.org.uk (109.154.100.71) by re-prd-rgout-003.btmx-prd.synchronoss.net (5.8.716.04) (authenticated as flitspace1@btinternet.com)
        id 61A69BAC23288EBB; Tue, 12 Jul 2022 18:27:04 +0100
Received: from [192.168.0.21] (unknown [192.168.0.21])
        by flitspace.org.uk (Postfix) with ESMTP id 9692FA07F4;
        Tue, 12 Jul 2022 18:27:04 +0100 (BST)
Message-ID: <33c0f2c5-5873-1d1c-8721-9c715f4034cb@flitspace.org.uk>
Date:   Tue, 12 Jul 2022 18:27:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/7] USB: serial: ftdi_sio: Add missing baud rate
 validation
Content-Language: en-GB
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org
References: <20220712115306.26471-1-kabel@kernel.org>
 <20220712115306.26471-3-kabel@kernel.org>
From:   Rob Pearce <rob@flitspace.org.uk>
In-Reply-To: <20220712115306.26471-3-kabel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/07/2022 12:53, Marek Behún wrote:
> From: Pali Rohár <pali@kernel.org>
>
> Add lower checks for requested baud rate for FT8U232AM, FT232BM, FT2232C,
> FT232RL, FTX, FT2232H, FT4232H and FT232H. For all of these the minimum
> baud rate they can generate is 183 Baud.
>
> Signed-off-by: Pali Rohár <pali@kernel.org>
> Tested-by: Marek Behún <kabel@kernel.org>
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>   drivers/usb/serial/ftdi_sio.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> index ea40f367e70c..717b97f4e094 100644
> --- a/drivers/usb/serial/ftdi_sio.c
> +++ b/drivers/usb/serial/ftdi_sio.c
> @@ -1330,7 +1330,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>   		}
>   		break;
>   	case FT8U232AM: /* 8U232AM chip */
> -		if (baud <= 3000000) {
> +		if (baud >= 183 && baud <= 3000000) {
>   			div_value = ftdi_232am_baud_to_divisor(baud);
>   		} else {
>   			dev_dbg(dev, "%s - Baud rate too high!\n", __func__);
Due to the above change, this debug message is now incorrect.
> @@ -1343,7 +1343,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>   	case FT2232C: /* FT2232C chip */
>   	case FT232RL: /* FT232RL chip */
>   	case FTX:     /* FT-X series */
> -		if (baud <= 3000000) {
> +		if (baud >= 183 && baud <= 3000000) {
>   			u16 product_id = le16_to_cpu(
>   				port->serial->dev->descriptor.idProduct);
>   			if (((product_id == FTDI_NDI_HUC_PID)		||
> @@ -1367,7 +1367,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>   	case FT232H:  /* FT232H chip */
>   		if ((baud <= 12000000) && (baud >= 1200)) {
>   			div_value = ftdi_2232h_baud_to_divisor(baud);
> -		} else if (baud < 1200) {
> +		} else if (baud >= 183 && baud < 1200) {
>   			div_value = ftdi_232bm_baud_to_divisor(baud);
>   		} else {
>   			dev_dbg(dev, "%s - Baud rate too high!\n", __func__);
As above



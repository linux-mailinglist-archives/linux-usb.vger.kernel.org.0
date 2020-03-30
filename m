Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E89161975C5
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2020 09:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729510AbgC3Hdc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Mar 2020 03:33:32 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41787 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729344AbgC3Hdc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Mar 2020 03:33:32 -0400
Received: by mail-lf1-f65.google.com with SMTP id z23so13279929lfh.8
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2020 00:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=pKIRr8NTBiADiLxiYouXzoypMDpd00U8pNk0QPzS4ZU=;
        b=uYaMcrVA6SbFGPzMvEcgAfvzo3ipZxmQh+RWAs4lWkVbdfLiIjoLgOKz5c0geGxEdE
         jck9GxVAxZZUF6EYr8SV7oAhviux5X9ls/Ofl50P7C9Ew1HQRfaoYg+b7CjsIJAI0cmc
         +w8cc4q3dt/7ikB4CJx8jsCM2oOb91F7Wtyx/6JHspSSfjkTfZdlxEuwkjoojXvWTyAT
         jr4tlTf1EsDPvI7QaJIokN2rYJempVD7ZkVlQepU8C3zQhoyW2kifw+uMov5wzJgFsdo
         kLoakfJBvxsmN2qXLq9OQXLPAqTfrj3ZnBl0Q/PUDwLi2B/uko3ulsn0gw42SaBMwr92
         fAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=pKIRr8NTBiADiLxiYouXzoypMDpd00U8pNk0QPzS4ZU=;
        b=b0RK9JJcxOmY4VtHRJKMH4M5eVC16EBZpAHUn+E9dXG+LlbBb6GqW98VT9AjmggJY+
         f1xMgjPc3DKJIymVddrltV1cSROFWu8A78fh2bsiEUY7bRlzLPTgF9iXNJaIvCphB9K2
         0KTFmgqDkNFWrSJoJkgthz8A0WIY5DVyuD42MwnGNiFZCnapyVFVCcoGtTl82waq0hi8
         fCUFJZCPWShbIW2fI4WA0a0z+1Oh4dEzcUoFL5X5G0At30xR8BfYjasCJcEUrp58zEzk
         9HWc56fB+Gx0vRpsDCe4ScH7IHKHmYXkqZ41UiyuUSnNB+43AYghAUAbQjr+fM+SnL4J
         FDEg==
X-Gm-Message-State: AGi0Pub8tCl35CqTgEjmuIp1GHLPwq22VmWagrb3cQp7gFoY0Ir/MEA5
        9s/Sj3Lwt68mGrP+z9wxfbW3OKmft6M=
X-Google-Smtp-Source: APiQypKC74oqlYjO0vMcqgkfMI2J2iMYEqs1JlcyNLuFSxRVYnNHGW+5y3d/GO28gKoFWXJSV00i7w==
X-Received: by 2002:ac2:42d9:: with SMTP id n25mr7016404lfl.97.1585553609669;
        Mon, 30 Mar 2020 00:33:29 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id j125sm6085933lfj.38.2020.03.30.00.33.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Mar 2020 00:33:29 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     John Youn <John.Youn@synopsys.com>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [RESEND PATCH v2 2/2] usb: dwc3: gadget: Properly set maxpacket limit
In-Reply-To: <92f81414-0d0c-d28b-843c-742db1034fbb@synopsys.com>
References: <cover.1576030839.git.thinhn@synopsys.com> <7817e1cfdd341a957c4be94ddf3843ae83516f5a.1576030839.git.thinhn@synopsys.com> <92f81414-0d0c-d28b-843c-742db1034fbb@synopsys.com>
Date:   Mon, 30 Mar 2020 10:33:25 +0300
Message-ID: <87mu7y2t6i.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:

> Hi,
>
> Thinh Nguyen wrote:
>> Currently the calculation of max packet size limit for IN endpoints is
>> too restrictive. This prevents a matching of a capable hardware endpoint
>> during configuration. Below is the minimum recommended HW configuration
>> to support a particular endpoint setup from the databook:
>>
>> For OUT endpoints, the databook recommended the minimum RxFIFO size to
>> be at least 3x MaxPacketSize + 3x setup packets size (8 bytes each) +
>> clock crossing margin (16 bytes).
>>
>> For IN endpoints, the databook recommended the minimum TxFIFO size to be
>> at least 3x MaxPacketSize for endpoints that support burst. If the
>> endpoint doesn't support burst or when the device is operating in USB
>> 2.0 mode, a minimum TxFIFO size of 2x MaxPacketSize is recommended.
>>
>> Base on these recommendations, we can calculate the MaxPacketSize limit
>> of each endpoint. This patch revises the IN endpoint MaxPacketSize limit
>> and also sets the MaxPacketSize limit for OUT endpoints.
>>
>> Reference: Databook 3.30a section 3.2.2 and 3.2.3
>>
>> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
>> ---
>> Changes in v2 -
>>    None
>>
>>   drivers/usb/dwc3/core.h   |  4 ++++
>>   drivers/usb/dwc3/gadget.c | 52 +++++++++++++++++++++++++++++++++++++--=
--------
>>   2 files changed, 45 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
>> index 6a6baadcb697..0f019db5e125 100644
>> --- a/drivers/usb/dwc3/core.h
>> +++ b/drivers/usb/dwc3/core.h
>> @@ -309,6 +309,10 @@
>>   #define DWC3_GTXFIFOSIZ_TXFDEP(n)	((n) & 0xffff)
>>   #define DWC3_GTXFIFOSIZ_TXFSTADDR(n)	((n) & 0xffff0000)
>>=20=20=20
>> +/* Global RX Fifo Size Register */
>> +#define DWC31_GRXFIFOSIZ_RXFDEP(n)	((n) & 0x7fff)	/* DWC_usb31 only */
>> +#define DWC3_GRXFIFOSIZ_RXFDEP(n)	((n) & 0xffff)
>> +
>>   /* Global Event Size Registers */
>>   #define DWC3_GEVNTSIZ_INTMASK		BIT(31)
>>   #define DWC3_GEVNTSIZ_SIZE(n)		((n) & 0xffff)
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index 5da266173146..3b3e6a655c6a 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -2207,7 +2207,6 @@ static int dwc3_gadget_init_in_endpoint(struct dwc=
3_ep *dep)
>>   {
>>   	struct dwc3 *dwc =3D dep->dwc;
>>   	int mdwidth;
>> -	int kbytes;
>>   	int size;
>>=20=20=20
>>   	mdwidth =3D DWC3_MDWIDTH(dwc->hwparams.hwparams0);
>> @@ -2223,17 +2222,17 @@ static int dwc3_gadget_init_in_endpoint(struct d=
wc3_ep *dep)
>>   	/* FIFO Depth is in MDWDITH bytes. Multiply */
>>   	size *=3D mdwidth;
>>=20=20=20
>> -	kbytes =3D size / 1024;
>> -	if (kbytes =3D=3D 0)
>> -		kbytes =3D 1;
>> -
>>   	/*
>> -	 * FIFO sizes account an extra MDWIDTH * (kbytes + 1) bytes for
>> -	 * internal overhead. We don't really know how these are used,
>> -	 * but documentation say it exists.
>> +	 * To meet performance requirement, a minimum TxFIFO size of 3x
>> +	 * MaxPacketSize is recommended for endpoints that support burst and a
>> +	 * minimum TxFIFO size of 2x MaxPacketSize for endpoints that don't
>> +	 * support burst. Use those numbers and we can calculate the max packet
>> +	 * limit as below.
>>   	 */
>> -	size -=3D mdwidth * (kbytes + 1);
>> -	size /=3D kbytes;
>> +	if (dwc->maximum_speed >=3D USB_SPEED_SUPER)
>> +		size /=3D 3;
>> +	else
>> +		size /=3D 2;
>>=20=20=20
>>   	usb_ep_set_maxpacket_limit(&dep->endpoint, size);
>>=20=20=20
>> @@ -2251,8 +2250,39 @@ static int dwc3_gadget_init_in_endpoint(struct dw=
c3_ep *dep)
>>   static int dwc3_gadget_init_out_endpoint(struct dwc3_ep *dep)
>>   {
>>   	struct dwc3 *dwc =3D dep->dwc;
>> +	int mdwidth;
>> +	int size;
>> +
>> +	mdwidth =3D DWC3_MDWIDTH(dwc->hwparams.hwparams0);
>> +
>> +	/* MDWIDTH is represented in bits, convert to bytes */
>> +	mdwidth /=3D 8;
>>=20=20=20
>> -	usb_ep_set_maxpacket_limit(&dep->endpoint, 1024);
>> +	/* All OUT endpoints share a single RxFIFO space */
>> +	size =3D dwc3_readl(dwc->regs, DWC3_GRXFIFOSIZ(0));
>> +	if (dwc3_is_usb31(dwc))
>> +		size =3D DWC31_GRXFIFOSIZ_RXFDEP(size);
>> +	else
>> +		size =3D DWC3_GRXFIFOSIZ_RXFDEP(size);
>> +
>> +	/* FIFO depth is in MDWDITH bytes */
>> +	size *=3D mdwidth;
>> +
>> +	/*
>> +	 * To meet performance requirement, a minimum recommended RxFIFO size
>> +	 * is defined as follow:
>> +	 * RxFIFO size >=3D (3 x MaxPacketSize) +
>> +	 * (3 x 8 bytes setup packets size) + (16 bytes clock crossing margin)
>> +	 *
>> +	 * Then calculate the max packet limit as below.
>> +	 */
>> +	size -=3D (3 * 8) + 16;
>> +	if (size < 0)
>> +		size =3D 0;
>> +	else
>> +		size /=3D 3;
>> +
>> +	usb_ep_set_maxpacket_limit(&dep->endpoint, size);
>>   	dep->endpoint.max_streams =3D 15;
>>   	dep->endpoint.ops =3D &dwc3_gadget_ep_ops;
>>   	list_add_tail(&dep->endpoint.ep_list,
>
> Please let me know if these patches are not clear or that they are lost=20
> somewhere. I'll try my best to clarify if anything's not clear.

They're now in my testing/fixes. Thanks

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6BoMUACgkQzL64meEa
mQaCexAAr+NOwgr88Z8k3VhFrebrgpLRm3FF8a76aryfAfaN6927EoDDsJe98eRz
s9o3H3K4bSBU5H0REEy2Bizixw5ICKbWBrlD5+3mBDw4rdb97T+LY05HzCk36DHY
M8gd71umZCgFy5fPolp2WmrrWR7yDjHvOyG0Bas9AZtrwfyOzXu2Vxs7M3QxxGMe
HeUeJo12icWPkwfBbMGzSuX2ny7D9HMGyHmmRNkGEJ0dX8z3Va2n9zjwID9upKck
/doB2vFse63GU/J5ea04lATgAshO/mhiFXZZCKHUGYylovE6oKygsBEqM1WiP2kf
dkWb80ATssXWt7xhSDmoA+C4T1p/JsEKWARGO1iLi64V9HS+b5sNWDHYCSuR2tJU
/u8lsY902GTE6HMP41F7dGVRjdOLJbMrKx1V63nfOJNWnhlKRLEkmiM/yUiaqW6i
0TIwYWHv+z5+E6bCvRKGn3zGDpbgnHJa6//R9sqpv9YZOatqFbbxGOhM9Zclsb7b
eRz+qEL8d0HSGMrEPuLSLfSEznz+VXRvoMiyy7qPX0dpJ0CpQzMDPfP6gB/CcAW6
0bifpyRVulaQf3bziQk2zrRM2fH6mJ3MxYKqbVWpcfwK8uivN4tJj5395iRHEDlG
zZnrG1BN3yEvCDZws3pqtpsgM4Vkzb5ovlbZ7wjk97Rvn+Ldz8g=
=VkYs
-----END PGP SIGNATURE-----
--=-=-=--

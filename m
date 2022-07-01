Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFF93563C1D
	for <lists+linux-usb@lfdr.de>; Fri,  1 Jul 2022 23:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbiGAV4P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Jul 2022 17:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbiGAV4O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Jul 2022 17:56:14 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE2C270AEF
        for <linux-usb@vger.kernel.org>; Fri,  1 Jul 2022 14:56:13 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1o7OcW-0007pT-9b; Fri, 01 Jul 2022 23:56:12 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1o7OcV-0000fn-Nt; Fri, 01 Jul 2022 23:56:11 +0200
Date:   Fri, 1 Jul 2022 23:56:11 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] usb: dwc3: gadget: fix high-speed multiplier setting
Message-ID: <20220701215611.GB7981@pengutronix.de>
References: <20220630140216.185919-1-m.grzeschik@pengutronix.de>
 <Yr6qMFCR4Dmr6oai@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Content-Disposition: inline
In-Reply-To: <Yr6qMFCR4Dmr6oai@kroah.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 01, 2022 at 10:02:56AM +0200, Greg KH wrote:
>On Thu, Jun 30, 2022 at 04:02:16PM +0200, Michael Grzeschik wrote:
>> For high-speed transfers the __dwc3_prepare_one_trb function is
>> calculating the multiplier setting for the trb based on the length of
>> the trb currently prepared. This assumption is wrong. For trbs with a
>> sglist the length of the actual request has to be taken instead.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> ---
>>  drivers/usb/dwc3/gadget.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index 8716bece107208..0fc3ecfaa48baf 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -1186,7 +1186,7 @@ static void __dwc3_prepare_one_trb(struct dwc3_ep =
*dep, struct dwc3_trb *trb,
>>  		dma_addr_t dma, unsigned int length, unsigned int chain,
>>  		unsigned int node, unsigned int stream_id,
>>  		unsigned int short_not_ok, unsigned int no_interrupt,
>> -		unsigned int is_last, bool must_interrupt)
>> +		unsigned int is_last, bool must_interrupt, int req_length)
>
>Why not put this right next to 'length'?

Yes, would probably make more sense, but:

>And wow, that's a crazy number of options for a function.  Why is this
>even a separate function at all?  Why can't it just be in
>dwc3_prepare_one_trb() as that's the only place this is called?

This is an absolute legitimate question. I will send a v2 including a
patch refactoring this to one function beforehand.

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmK/bXgACgkQC+njFXoe
LGSEehAAyrJtD6ZRGVMT9J4+k6qxZkwBYJGF/62fFkUzMdUp4FhZYZuW8bgMsKIT
eaE+mdHu1cQMzCEEmUApCJbpfOs+oPUTSOwPgmze6nuYM5lLT3eH6nNl/2KIMn22
HNdEaZC7s2tAG3VfWJAoYqBsWHtozq9TaOBFzisc8mCTr/AVU09ro9buGlBJ5Mru
5p/cpM2PW+B3QF+XZ1vSAZ+pVa6+aeIrLwqDi/FIAkuvbPV4Z66yWYyluGsAsYLR
Anw/wGJsXo5Yr/QI+72JxJgIaDHMpoQLIUOg/Kdu0XvlNiB2hTRA9Sk30hFOpB9E
urXgHHyziquepcgOroRXWlm31rhFOVyGNN8A8ewtaYWR9tXh/AGbWfLTjY2CJZ6f
SiWplHE31cPWiusElTpAcVW5+ThhD7a4ytMl6OmL0T5LkGQvPwL8crmi9k5UBHLu
KkLdP8IHogPsxfzwtn6oDLtvBXUfqfItbom4ZtYf3yFfaMwH+3OUdZ8ydZNcbsCJ
pRRnf5RRS/cv0Y05uKlZMe3fvAtFni1NBT8wiKuRxvNEMU8OBZwsVC5KhSzi4+jA
t710oEbEwUqS/w+IAP/h9MNY777KhW61iPLmHl4Q8mQkbV2oNm9CF7TXTLUgN9lS
ytgvf2BXWGXz66ogaAEoYQd/MRukiPs4oWhcBrY0mM9OViL5OKk=
=ZEB8
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--

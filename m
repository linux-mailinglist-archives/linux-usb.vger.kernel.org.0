Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 394944BE045
	for <lists+linux-usb@lfdr.de>; Mon, 21 Feb 2022 18:51:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357563AbiBUPK3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Feb 2022 10:10:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378840AbiBUPK3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Feb 2022 10:10:29 -0500
X-Greylist: delayed 69 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 21 Feb 2022 07:10:03 PST
Received: from mx-relay84-hz1.antispameurope.com (mx-relay84-hz1.antispameurope.com [94.100.133.252])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE7411A399
        for <linux-usb@vger.kernel.org>; Mon, 21 Feb 2022 07:10:03 -0800 (PST)
Received: from unknown ([185.80.187.2]) by mx-relay84-hz1.antispameurope.com;
 Mon, 21 Feb 2022 16:08:51 +0100
Received: from grp-ex01.Vivavis.int (192.168.17.53) by grp-ex01.Vivavis.int
 (192.168.17.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Mon, 21 Feb
 2022 16:08:44 +0100
Received: from grp-ex01.Vivavis.int ([::1]) by grp-ex01.Vivavis.int ([::1])
 with mapi id 15.02.0986.015; Mon, 21 Feb 2022 16:08:44 +0100
From:   "embedded (VIVAVIS AG)" <embedded@vivavis.com>
To:     Johan Hovold <johan@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: AW: ftdi_sio: Problem when changing the baud rate after a transfer
Thread-Topic: ftdi_sio: Problem when changing the baud rate after a transfer
Thread-Index: AdgGJbRPj9Lxv6TJRBW2/KYX/66liQN/alhwAJMJcYAEMVYX0A==
Date:   Mon, 21 Feb 2022 15:08:43 +0000
Message-ID: <73e3d18172e24f6092ecb6e3998d6b9c@vivavis.com>
References: <5aae37a8029549d8a9ef28f2e39fe58f@vivavis.com>
 <1ec54d4f592c46b7a14109df559072e4@vivavis.com>
 <YfeV6f6hnz7Cgrt/@hovoldconsulting.com>
In-Reply-To: <YfeV6f6hnz7Cgrt/@hovoldconsulting.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.7.170]
x-g-data-mailsecurity-for-exchange-state: 0
x-g-data-mailsecurity-for-exchange-error: 0
x-g-data-mailsecurity-for-exchange-sender: 23
x-g-data-mailsecurity-for-exchange-server: 61419075-592b-4c8d-b7a0-bf1d145a8b8e
x-c2processedorg: 2f045ba3-9b34-4118-a5bd-6c10d5957477
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-cloud-security-sender: embedded@vivavis.com
X-cloud-security-recipient: linux-usb@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay84-hz1.antispameurope.com with 9EFE11724DE6
X-cloud-security-connect: unknown[185.80.187.2], TLS=1, IP=185.80.187.2
X-cloud-security-Digest: bba412970e2abb44c37b4e1b94158c5b
X-cloud-security: scantime:2.192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=vivavis.com; h=from:to
        :cc:subject:date:message-id:references:in-reply-to:content-type
        :content-transfer-encoding:mime-version; s=hse1; bh=v8ES2GCd1Bh5
        oFij7K8A6Xfvh/gOg79aZKiW5tWRfZ4=; b=fiE+L9mtuCRR1bYeFOjHII2oZPYv
        Q9M6N4c3ZH50qseWWaxiFVrHFprB9TBgyMS1X04xV8hQbVyZW84ljokhT76J67QL
        P7LiP2r7ixOKAt1rtPYfKFn98TrkN5a+jbLFZUq2atmQz3+i2v4nOytpS4biHcj1
        HyK5ptdXCMMvwikJ01G9mJy0CxRbdi4uoYbPjgpNPdNm0Gv75+Bsg2vg1W83B/Sh
        6+YlqWiiEtQxdCVD5/4m4aJWIkty70Ej1nDALWtp1UKpYEHvA3ZaQWOBevqemsGn
        z4uo3Ng+6NijVzgKRgK8MfDhQj/+h2U5vDN4vSJzTUaZFDClPRZAyF0ZsA==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
thanks for the suggestion.

> > > Hi,
> > > there seems to be a problem with the ftdi_sio driver in conjunction=20
> > > with an FT2232C and changing the baud rate.
> > > This behavior is observable at least on linux 4.19.190.
>=20
> You need to reproduce any issues you have with a more recent kernel such =
as 5.16.
Unfortunately, I cannot use a more recent kernel due to restrictions
with the development environment I am using. I did compare the code of
the ftdi_sio driver in version 4.19.190 with code included in a more
recent kernel release. I did not spot any fundamental changes that would
suggest that the problem was fixed.

> > > I verified that the driver does in fact ask the hardware if it's tx=20
> > > buffer is empty when the hardware status is reported.
>=20
> How exactly did you verify that?
I checked the code of the ftdi_sio driver, which captures the state of
the tx empty flag that is reported by the IC every time a specific USB
message is sent to it.

> Unless you use TCSADRAIN (or TCSAFLUSH) the driver is not supposed to wai=
t for the outgoing buffer to drain.
>=20
> Please confirm if changing this fixes the problem you're seeing.
I can still observe the same behavior, even after changing the calls
to tcsetattr to use TCSADRAIN instead of TCSANOW. The last byte of a
transfer is still being shifted out with the wrong baud rate.
Is there anything else that can be done in software to possibly prevent thi=
s behavior?

Thanks and regards,
Yasin Morsli

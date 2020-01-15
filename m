Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04CB213BB7F
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 09:51:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729028AbgAOIvz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 03:51:55 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45744 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729016AbgAOIvy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 03:51:54 -0500
Received: by mail-lj1-f193.google.com with SMTP id j26so17593501ljc.12
        for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2020 00:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=O8QX7lshn7S4wP2q+6eXSQxQqLsU2iaIy57WiaY7geQ=;
        b=hPpFwht5nIAJrFC4hbK0i9diwp57yF+x3BNRb9eZRViHVH/BdJ3PRdU2Shw03KJJTp
         eCMKngj6wwOuTXktYDPcIhP/l2/JTkV5ybyr9C8Fd34oSKJ1kimF+CozqcJpvIYJ+qEk
         B8pm1xu8TI+H8O0TtlOgCL8gPjIv1BNlZVWpPKouu9Gf79vP3z39aqvETH+KiFo+abBc
         MnIOeLfXGFy6eGQxTD+yd0cIHFxZZxfIdRPW9Wo73yaamkmS+7YAp7NptnxBNCI1QkXM
         KPUN0XFYT7cCTtO2Hm8XaPfVFq59peobTLW90d0yxOGuPESZTILWtTQSDIgb1YD2b8e4
         DhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=O8QX7lshn7S4wP2q+6eXSQxQqLsU2iaIy57WiaY7geQ=;
        b=gfeMKu7MfMa4F3QKjYjjiVCGJvsSmyNyDZUOoYc8yvNi8Pg8IXbCD/H2MFV3Vh4XOQ
         Xy+epiXlJ+7qtTJ8k3Eq5Y1YjYhWwBUj3AiwbDmNnps5egVAkeoUcuDk2CYWSnF0PLUG
         yeDOBF8LkMyV36mnj2k5ZPbX0nS7xRyw89qsZZ3U6x29ueH3gZKe9xk8EVkIJ+PL1xg3
         M8/KSzfEI9WGGe7V+l05Ejim8oS3Jv7h24LcVafEt3Mz8ouRxtL5fyk7EreEL0Ls79cX
         JoyFkJzmH2gbgu/qQA/ncQPK7CcZZ9xG9WCpT4AQ8Y5STP7/X3qr9wnuZSWtIPxZkOmF
         k9Yg==
X-Gm-Message-State: APjAAAVPAMDObFdvMqGCJ0rF5TFe98DSp4NmokJYZv3ESGDByo4rn7fb
        sPEQT5un3Dx4DWnGZMD/zJ3zAyTKFB17oQ==
X-Google-Smtp-Source: APXvYqwlvtfZIFwEArI2YL+OzXSNbr9JUpSRy4M5dxcaGHSEGvEQBJCAM8NRTKKM4cciQetKRPaBzQ==
X-Received: by 2002:a2e:858f:: with SMTP id b15mr1123392lji.275.1579078312206;
        Wed, 15 Jan 2020 00:51:52 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id z5sm8832581lji.40.2020.01.15.00.51.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 00:51:51 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v2 0/3] usb: dwc3: gadget: Improve END_TRANSFER handling
In-Reply-To: <812db213-b30b-1f51-649d-62de723dcac4@synopsys.com>
References: <cover.1576715470.git.thinhn@synopsys.com> <87r208sw7o.fsf@kernel.org> <812db213-b30b-1f51-649d-62de723dcac4@synopsys.com>
Date:   Wed, 15 Jan 2020 10:52:52 +0200
Message-ID: <87muap6qzf.fsf@kernel.org>
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


Hi,

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>>> This patch series improves the handling of the END_TRANSFER command:
>>>
>>> 1) Don't issue multiple END_TRANSFER commands while the previous hasn't
>>>     completed
>>> 2) Don't issue START_TRANSFER command while END_TRANSFER hasn't complet=
ed
>>> 3) Remove arbitrary 100us delay
>>>
>>> Changes in v2:
>>>   - Remove unused variable
>> Tried applying these, but it failed on patch 1.
>>
>
> Your next branch doesn't have these prerequisite patches from mainline:
> d3abda5a98a1 ("usb: dwc3: gadget: Clear started flag for non-IOC")
> 2d7b78f59e02 ("usb: dwc3: ep0: Clear started flag on completion")
>
> Will you rebase on v5.5 rc-x? Let me know how we can proceed to resolve=20
> the conflict.
>
> Also, have you a chance to take a look at these patches:
> https://patchwork.kernel.org/project/linux-usb/list/?series=3D214669
> * usb: dwc3: gadget: Properly set maxpacket limit
> * usb: dwc3: Fix GTXFIFOSIZ.TXFDEP macro name

indeed, now they've applied cleanly. Thanks

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4e0uQACgkQzL64meEa
mQZOihAAv67DCAX0SOuEHIz27mMGdV0vjkfrgdgojsUNRIsBXaKNyGaK05xgpBRW
TG620hnFeLwVN797VmVXjNVPWMkZpidllzDjsFRCTsM5ZlD1i9U+FFVEEC5Cgdly
yBSD9wQ4+COOenwAfRFjx4UByV2LfTBtx/I49XL+INLpYpsa9ALpknBvkI1+vPlX
1H4Piqo06pBijYhnGXRHh9pdbah8eRCpxlk5uAvTmRsJ4zD1AVYexHJC600duXKV
HgoPFmWqfE10O1hmLMdpubTWT2GBFQqtTEErqcOA2qg/nigyeUAAaK8mxpYdKwYR
mlU20u3QStZpms78pPej3ut5ZZs/LHgdpyX66pdTiYZqfL9mSusNP5/rBQ7LkvOG
MY0BWZfDPDBRXSBXvmyNruDzXmw8Q9kock4aepnvrqE16y7O9JUFpg/jCiTNDYGR
kybZ0baAScZbsbxAkDCtIpGfOvonWFLbX9tgPHuCRAMAnP7Jc0uiQcpCHe72yLLn
fs7SysJ6s7eAQZPuzHznvXUkWEaUBKWft8M/ZbZRIIeJi8mOSE2yg1Ie/FQLpMB3
ORVOWOKtHjX24HVUhPuCI7cgpv9BCFxoaDzv2Z7k1J4lSf/KtC8yfC3Ie7riVRv+
M4ht7pHO4xxTltLwE59BvzDwb0diz4/rxS2KX+s99iUxNLNhdew=
=ZBN9
-----END PGP SIGNATURE-----
--=-=-=--

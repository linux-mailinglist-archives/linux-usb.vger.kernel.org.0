Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 186D91D0A00
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 09:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729490AbgEMHgM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 03:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgEMHgM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 May 2020 03:36:12 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E47C061A0C
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2020 00:36:11 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id d21so8904493ljg.9
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2020 00:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=BkmZqV3BWJFbYwL4KXbLGxX8yD/o7JICC2OmyXkPnFA=;
        b=smAR01W+6ZK4xamH/5hCfc7hPHM4+2UrHjuASoEbOjX72qTv0XCO6f7Y2gv3mbYRHa
         D8FS1iEgEog1zANIfFMMlT5eOHOZ2RaKJhY51vUqLlZUv7YX5pmCFY/AgC7nQeyRV6ah
         juVK03QH/HPEFAbJrdc+uQTSzKHDrMD7K+k8fbxs0ccrhQVcJCqRRCEcwdpOofud3e03
         7vv0bKKsLdjvdTI7qUcrPC5f95WVnSkLIW0tiKtAmbLIi2oxbVQJBNAKUm25abWmZspG
         uqFO5Tv4Z6FhLlnH4NmmhteopQptYSBPML4e70ziJsmSlVBJCEs6gLxYvHmEYBFIF4ex
         Rj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=BkmZqV3BWJFbYwL4KXbLGxX8yD/o7JICC2OmyXkPnFA=;
        b=buANOaCpAuFWE6Q8amRT24WZ0SqJnxdElJfRSqIsluE52wBXT1fHkKUe1bWFuZschl
         KA6Qtxsj/bWfK8Z1lObwHbCNf7Om008aLhJnnzCfuIRVwPMrolfyx+Sp5xtd3ZebtYpF
         XoniXHZ4CoKrCMmT9CWPxVATSFo43tybPRzNWr/5Z//2KGi09Ihu+2ZP1Qj1y1vUZsML
         FwbJgdwVvilits+9K+xD4s7S0qg2ZNuNLeBhHxvQE61/huLpEyNZ6MQsk1EtTTU+VzDr
         nKuJjKbZV1PO1WC7qnckrO7EUVKnfSgUuplK9XrKraSbYVlqNuiyNxIIgGiYxnmxxnXW
         lV0w==
X-Gm-Message-State: AOAM532Pv6vqLL8evCJ3znwY5kwThzsPJi6X9C2/ALzBwLWMUjAkcx/i
        BsuOn0h4Iguw7YyvLpQcXJLEU5In
X-Google-Smtp-Source: ABdhPJzrxAxeU/uD0enZ9TYYs51CpTZONVqA6IkgmYxsCS+RpzcS6Mib77jhJNOh7TvY7JN/HMIw9w==
X-Received: by 2002:a2e:3009:: with SMTP id w9mr16736112ljw.71.1589355369982;
        Wed, 13 May 2020 00:36:09 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id j2sm6722126lfb.78.2020.05.13.00.36.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 May 2020 00:36:09 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Sid Spry <sid@aeam.us>, Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Documentation for Raw USB ConfigFS
In-Reply-To: <8ee3914e-7876-46aa-bade-7cf14df7efdc@www.fastmail.com>
References: <0507a041-44f4-4257-adaf-3b17de3baf81@www.fastmail.com> <20200506091750.GE30237@b29397-desktop> <8ee3914e-7876-46aa-bade-7cf14df7efdc@www.fastmail.com>
Date:   Wed, 13 May 2020 10:36:05 +0300
Message-ID: <87h7wkp9qy.fsf@kernel.org>
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

"Sid Spry" <sid@aeam.us> writes:

> Hi Peter, thanks for pointing me towards the ffs-test. Unfortunately after
> some exploration in that area I still don't see how I would add a preexis=
ting
> function to the configuration to be handled by the kernel.
>
> I do see something in an AIO test in the host code where libusb is used to
> bind a kernel driver to an endpoint. Is that something that will be neces=
sary?
> Device side, I'm still unsure how I tell the function to handle ECM/ether=
net
> on a collection of endpoints.
>
> I understand how USB works fairly well, especially on microcontrollers, b=
ut am
> a little lost still in understanding the Linux machinery for USB.

please, stop with your top-posting and break your lines at 80-columns. I
have re-wrapped your lines so you see how they should look.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl67o2UACgkQzL64meEa
mQbYfQ//e2IgCFKD57CiPCUorz383ZG9r7q9ftZS1/8K4ytyBl9AbR2zMEESXpFT
BPW4eMiYplWzGRruqhBOz4IoOSO6c2wD3RLLOGX2rXotwJkShc0pBMLIN8Pb8MKx
JWDmY49PkTXPe5tZjVwe79u2eQlW5ILbggkJq+Z+GoVX0GXzeMBMFuXDncAPT1Jk
TOaJy+UhMNWguWLV24JahZkVZ+gm8INDLEi38qjs2moE/ALkRRB+rBCLHe6yx0kJ
QaAacZoyEhUfvtZmGK5A7upqQh/Z7ZBiVMBH6MGc3FZ9pu+uad9kWk1voswZEtxZ
Wz0LlLvKzg3JZKbCZQDqmEkbGCXDVvy0dBzc20fuYvhuP9X31T6Mb1jFl8rsVBxb
kcDoU5IsQAhZMbDczmNajE7PkId4E+18XXWbyfmuyT4gQvnEsciC+/Kgk7ysi4Se
OPAB/ZEuOzUXvpvAT7cbzsB73iWQyl03kKuFIdnCJC5oikJXlL2EXTfwSE+kyrql
iRTPBsVHEJZNFBsRbFfHr0EyMFti0vQ6vizFVFLeoLwwsCoCPqYuWOwfBlIcsF7a
eGnfJmccX9WLBQeGemR4s/MW7hqMBvNXDZtIVbt3aIVbXrnLWbnMPr3nS9Xwjw8X
I2QRGY9wkx6j3cHMM46TzcKAQEGhl4r8KkDxAzWT1RO6NfpnwYA=
=tlGh
-----END PGP SIGNATURE-----
--=-=-=--

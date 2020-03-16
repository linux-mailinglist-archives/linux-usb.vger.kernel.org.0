Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C07E18653E
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 07:51:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729605AbgCPGvx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Mar 2020 02:51:53 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43580 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729319AbgCPGvx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Mar 2020 02:51:53 -0400
Received: by mail-lf1-f65.google.com with SMTP id n20so9663956lfl.10
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2020 23:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=z51u3+Na6XSCPrAvcHaxd66njJi3Gqp5y0/zioyXff8=;
        b=YSKHxgTW5B6lVLaZxGSUMEe94or2tahgbP1iFsotqJfSHFm3NvuDjoBscMVXivgWDO
         UmmmEHT/oS6D9eEDZ4EXgYVxWuYbsW60XJO1PX6mXGqM9v1rtBnUos5jt+T5Rr6f3xyV
         Sq+wX5apT6pbxQVlZbGEMBUi/diSGM/xJZctT127u1VrbQtAKTPfhZI5y5xl7MhGUn1p
         KNkgh/H4r8emAQFdHryt9tJP0VEWRGhpoHQjDi1y+FbWMRvrhguZCECLW1GQCxEpOAFC
         HeYjKerZbDEf066G9hR0w/eVvCUas01XF0uTCxn7ozwmW0YfhyLzMPYKnhns4i4UTMKW
         aIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=z51u3+Na6XSCPrAvcHaxd66njJi3Gqp5y0/zioyXff8=;
        b=pFXVguyh3trt3XVGMFvdbgBLeR317WcqZgnf9hVLUSy3r3GMhUuKsAh1+vFLQ5kHYL
         ERIPck5dg+39JdvCZCHiIGi3FRpK2JO+W6X4AqmrMPW4Obf9yUSzoJgUOUl2ZUm/BGj1
         RUExqg3vfwfSWqyAujaHkyeHLHPUa9Svqafvuce45zdj3XE4m5N37fiNSSiry0FWPRL9
         tu5VtbBFjLE7AuERk5zaISFDdnreqdzuE7Xrw2c0KZ63cWXnCvhV6KeBTpeftZoODG9x
         M2nhbeYXengwJ+MBOi1CJbS1C2fSnbQbsq2O9R2JqNVL35qDoiVFtYFrbYSSYEb28UQr
         bxKw==
X-Gm-Message-State: ANhLgQ3wXRmUZ4FW2XymSu+xUzy3IMGOphnGF77A3kAYshvqlRj9Zv9P
        QX87GnrIG/5iG25bS3f0XXXEqfLbAGo=
X-Google-Smtp-Source: ADFU+vtxFVhwOuDCzaQEGo/c/PuJsZ47LqYSlmKOJGDxBiytDtENVbvZ+kVm2ZU578Cx4YJUrMAPxg==
X-Received: by 2002:ac2:5094:: with SMTP id f20mr15688169lfm.32.1584341508711;
        Sun, 15 Mar 2020 23:51:48 -0700 (PDT)
Received: from saruman (88-113-215-213.elisa-laajakaista.fi. [88.113.215.213])
        by smtp.gmail.com with ESMTPSA id r2sm11201260lfn.92.2020.03.15.23.51.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Mar 2020 23:51:47 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 4/6] usb: dwc3: gadget: Give back staled requests
In-Reply-To: <5329c3d7-4975-a935-ee85-a51512235c95@synopsys.com>
References: <cover.1583443184.git.thinhn@synopsys.com> <a3732fbf370a2cf180c1c5757f46faed8399bbe5.1583443184.git.thinhn@synopsys.com> <877dzmeztk.fsf@kernel.org> <5329c3d7-4975-a935-ee85-a51512235c95@synopsys.com>
Date:   Mon, 16 Mar 2020 08:51:43 +0200
Message-ID: <87eets23nk.fsf@kernel.org>
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
>>> If a request is dequeued, the transfer is cancelled. Give back all
>>> the started requests.
>>>
>>> In most scenarios, the function driver dequeues all requests of a
>>> transfer when there's a failure. If the function driver follows this,
>>> then it's fine. If not, then we'd be skipping TRBs at different points
>>> within the dequeue and enqueue pointers, making dequeue/enqueue pointers
>>> useless. To enforce and make sure that we're properly skipping TRBs,
>>> cancel all the started requests and give back all the cancelled requests
>>> to the function drivers.
>> Which function driver is *not* cancelling transfers correctly? We can
>> (and should) be defensive on dwc3, but let's not hide bugs on function
>> drivers either.
>>
>
> I didn't review all the function drivers for this. I just see a=20
> potential issue and go for a more defensive approach. What's your=20
> suggestion?

Fair enough, that's good for my understading of why the patch was
created. Is there a way to add a WARN() or something like that so we
catch erroneous gadget drivers easily? Also, could you check if we need
a documentation update for the gadget API with regards to this finding?

cheers

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl5vIf8ACgkQzL64meEa
mQb0qRAAtqpTgzHawpR9z1yl7u+zg6Xd+BAbNE5bGP44PxdHGskLIMF8zf8YOcOx
gG4OS9ZRi2Obuz6ZiPTmamn1KSBwT5wFW7idrKnmGRpgshRd+aSUAUtEoAADbL9L
bkXPtfCKJOXV06/CAroZxy9LLHz/aErd8AIEWqHbs2ZtpZM4uJo7khJWni7zW0Y5
UPQZkUXFVLwmWPXX0DOnZH6RnkvgmHg71Z3SK9mawnbMe/tjXYJUt4vO65EfkNNQ
aDatX7TbhSRewJut5FelqO0xaMIaATFQ4Te5RwCb5kAaCAa7hXiYNJ5gMmavTqnm
2s7IIscm8a8nunFSycIl20gJ4eXbeNvOPukTWHqGPa2+xOjv+qTgXMLav4m9Qr3u
/h9gyb/DgENsll023p799Gj0MjDEHs935zRmKlVcmWTi09xhNp8cFYMStp+gP6Tx
DKc6Brls4qKc23618BdMi+6oISFbsi3RBietxU72CSYgv0G5mCprL8kPK+xjjvud
cvXgYzIkhtOUkBTx5gcAVXBphsQB96AZkHdCbK302yx34lDuwtHkDgcqeaS2MZdB
0yiH0W+lzeKUvEXcHx/bWMBX7XAPPVkr7eTrZfKVAFfwL0NTqSLn4eQ8unoPliUC
XKjxNT598A4JoqF7DCYx/wDQKeZTJxJySjj1Wh3a6ZFWJdRWZWI=
=eOGK
-----END PGP SIGNATURE-----
--=-=-=--

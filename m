Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFE9357F0
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 09:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbfFEHgN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 03:36:13 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51085 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726671AbfFEHgM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jun 2019 03:36:12 -0400
Received: by mail-wm1-f65.google.com with SMTP id f204so1159364wme.0
        for <linux-usb@vger.kernel.org>; Wed, 05 Jun 2019 00:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=aSignLL10T4DWwqehCksvv/bOSVVxiLJ8gnZ3iuU7M4=;
        b=WtOdtYHyfO2wh5RwvcSc9gfKMf2U9lWKYDFCJ7SrzFkK0IF2PqQvoBwtQEwH68YlrO
         nozmDkAiKtFeo4N4S+bUS8NCXnu7l9n2iq5rvTiuRQLRCKtxak0OBMJ5fTOHfMI4r/YL
         82u4abk/Xk9V/A/az0YjwN2KVxFCJQBqNGbhajWReO8CSsRLL+lyCZVjU0ekmy1mwJ6T
         OY77mOewY4bYcQn17IgkIzE1hjZPzX0BoPMJopGD8ylX5Zr/NytkhEKCXowiYP6H8KH/
         X0nuSfdPowKgRti1Qsdw/86sBLmS+Dc/GKNUfTUN1CBcT7eWh2e55dFmdLz6FU/VUrGu
         AN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=aSignLL10T4DWwqehCksvv/bOSVVxiLJ8gnZ3iuU7M4=;
        b=mlbr8QT2DEQ2iPYu+mceW4mspFeHts/zP+gN44KDuXpXZHnK/Fk7Qal+IbV0VOpLxD
         KNG6htN0Pywq5pMTBT4BkuG84J63e7XqYUt9gFvCF3FOqIeSpYVleOzQ58J3ly62X6lT
         U9MCr5/MNzUc6N0caqjJxZBKhD5X/JP4Y/IHIlMczVBFMAEEjVo4oCm2Y+VucnyHaFqO
         o0v3OVAzaZ44omSn4iFFo7Gk878/lb5IgmYR11RDr0ONLySCfDcNSXSP8BCKDPYpdhZ3
         YyQlSa+wgRC6bO00Mj0pWo/1T0BFw4zqn9on5p3FZy5g6/TnSmeqPRvyXiNvuULmNZjo
         wb0w==
X-Gm-Message-State: APjAAAXRFKg9btj8BTgzSL5vBButFUIvkCUkU6V8VqW2NejdL3mtq01p
        GFzLCsDhK2LTbV5UgJ19/aa/Og==
X-Google-Smtp-Source: APXvYqzlX8GPeIILAUa8NHx5iWZbhehWh3x/JEYFhOzZNhocEqqs3SBZNMx0DOxvCmIft0FSn6pXQA==
X-Received: by 2002:a7b:c549:: with SMTP id j9mr19928532wmk.122.1559720170331;
        Wed, 05 Jun 2019 00:36:10 -0700 (PDT)
Received: from angus.unipv.it (angus.unipv.it. [193.206.67.163])
        by smtp.gmail.com with ESMTPSA id t14sm21084477wrr.33.2019.06.05.00.36.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 05 Jun 2019 00:36:09 -0700 (PDT)
Message-ID: <9b013238be4e3c63e33181a954d1ecc3287d22e4.camel@unipv.it>
Subject: Re: Slow I/O on USB media
From:   Andrea Vai <andrea.vai@unipv.it>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Date:   Wed, 05 Jun 2019 09:36:04 +0200
In-Reply-To: <20190604054300.GE1588@kroah.com>
References: <2a9e1be71a2c6c940dac904752fdd34129745444.camel@unipv.it>
         <20190530132522.GA21005@kroah.com>
         <86676f40a8c1aa44bf5799eac6019183d6d33336.camel@unipv.it>
         <20190604054300.GE1588@kroah.com>
Content-Type: multipart/mixed; boundary="=-cTNppwRX7+7P17Ih7f4+"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-cTNppwRX7+7P17Ih7f4+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,
Il giorno mar, 04/06/2019 alle 07.43 +0200, Greg KH ha scritto:
> On Mon, Jun 03, 2019 at 01:13:48PM +0200, Andrea Vai wrote:
> > Il giorno gio, 30/05/2019 alle 06.25 -0700, Greg KH ha scritto:
> > > [...]
> > Hi,
> > 
> > > Any chance you can use 'git bisect' to find the offending
> commit?
> > Yes, I am doing it as I managed to build the kernel from source
> 
> Great!  What did you find?

# first bad commit: [534903d60376b4989b76ec445630aa10f2bc3043]
drm/atomic: Use explicit old crtc state in
drm_atomic_add_affected_planes()

By the way, as I am not expert, is there a way to double-check that I
bisected correctly? (such as, e.g., test with the version before this
one, and then with this commit applied?)

Attached: "git bisect log" output.

Thanks, and bye,
Andrea

--=-cTNppwRX7+7P17Ih7f4+
Content-Disposition: attachment; filename="bisectlog.txt"
Content-Transfer-Encoding: base64
Content-Type: text/plain; name="bisectlog.txt"; charset="UTF-8"

Z2l0IGJpc2VjdCBzdGFydAojIGJhZDogW2NkNmM4NGQ4ZjBjZGM5MTFkZjQzNWJiMDc1YmEyMmNl
M2M2MDViMDddIExpbnV4IDUuMi1yYzIKZ2l0IGJpc2VjdCBiYWQgY2Q2Yzg0ZDhmMGNkYzkxMWRm
NDM1YmIwNzViYTIyY2UzYzYwNWIwNwojIGdvb2Q6IFs4ZmUyOGNiNThiY2IyMzUwMzRiNjRjYmJi
NzU1MGE4YTQzZmQ4OGJlXSBMaW51eCA0LjIwCmdpdCBiaXNlY3QgZ29vZCA4ZmUyOGNiNThiY2Iy
MzUwMzRiNjRjYmJiNzU1MGE4YTQzZmQ4OGJlCiMgYmFkOiBbZDcyY2I4YzdkOWRiZDljZTgyMGM4
MGYzZmRkYjU2YjI5NmJhOTZmY10gTWVyZ2UgdGFnICdyaXNjdi1mb3ItbGludXMtNS4xLW13MCcg
b2YgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BhbG1lci9y
aXNjdi1saW51eApnaXQgYmlzZWN0IGJhZCBkNzJjYjhjN2Q5ZGJkOWNlODIwYzgwZjNmZGRiNTZi
Mjk2YmE5NmZjCiMgYmFkOiBbYzliZWY0YTY1MTc2OTkyNzQ0NTkwMDU2NDc4MWE5Yzk5ZmRmNjI1
OF0gTWVyZ2UgdGFnICdwaW5jdHJsLXY0LjIxLTEnIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9saW51c3cvbGludXgtcGluY3RybApnaXQgYmlzZWN0IGJh
ZCBjOWJlZjRhNjUxNzY5OTI3NDQ1OTAwNTY0NzgxYTljOTlmZGY2MjU4CiMgYmFkOiBbZTBjMzhh
NGQxZjE5NmE0YjE3ZDJlYmEzNmFmZmY4ZjY1NmE0ZjFkZV0gTWVyZ2UgZ2l0Oi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2RhdmVtL25ldC1uZXh0CmdpdCBiaXNlY3Qg
YmFkIGUwYzM4YTRkMWYxOTZhNGIxN2QyZWJhMzZhZmZmOGY2NTZhNGYxZGUKIyBiYWQ6IFtjMmYx
ZjNlMGUxN2Q5NGFiMGM2NmQ4M2U2Njk0OTJjYjllOWEzNjk4XSBNZXJnZSBnaXQ6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZGF2ZW0vc3BhcmMtbmV4dApnaXQgYmlz
ZWN0IGJhZCBjMmYxZjNlMGUxN2Q5NGFiMGM2NmQ4M2U2Njk0OTJjYjllOWEzNjk4CiMgYmFkOiBb
YjNjYzJiZmU3MjQ0ZTg0OGY1ZThjYWE3N2JiZGM3MmMwNGFiZDE3Y10gTWVyZ2UgdGFnICdpM2Mv
Zm9yLTQuMjEnIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9pM2MvbGludXgKZ2l0IGJpc2VjdCBiYWQgYjNjYzJiZmU3MjQ0ZTg0OGY1ZThjYWE3N2JiZGM3
MmMwNGFiZDE3YwojIGdvb2Q6IFsyYWM1ZTM4ZWE0MjAzODUyZDZlOTllZGQzY2YxMWYwNDRiMGE0
MDlmXSBNZXJnZSBkcm0vZHJtLW5leHQgaW50byBkcm0taW50ZWwtbmV4dC1xdWV1ZWQKZ2l0IGJp
c2VjdCBnb29kIDJhYzVlMzhlYTQyMDM4NTJkNmU5OWVkZDNjZjExZjA0NGIwYTQwOWYKIyBiYWQ6
IFtmYjg3OGQxMDZiNzczOGFlN2NkYjUxM2Y5ODg3NmIyMmJkNmE0ODVmXSBNZXJnZSB0YWcgJ2V4
eW5vcy1kcm0tbmV4dC1mb3ItdjQuMjEnIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9kYWVpbmtpL2RybS1leHlub3MgaW50byBkcm0tbmV4dApnaXQgYmlz
ZWN0IGJhZCBmYjg3OGQxMDZiNzczOGFlN2NkYjUxM2Y5ODg3NmIyMmJkNmE0ODVmCiMgYmFkOiBb
ODE4MTgyZGQxMDk3ZmRjNDkyYWFlZjliMDg3NTVlYTEzMjc0MzUyZF0gTWVyZ2UgdGFnICdpbXgt
ZHJtLW5leHQtMjAxOC0xMi0wMycgb2YgZ2l0Oi8vZ2l0LnBlbmd1dHJvbml4LmRlL2dpdC9wemEv
bGludXggaW50byBkcm0tbmV4dApnaXQgYmlzZWN0IGJhZCA4MTgxODJkZDEwOTdmZGM0OTJhYWVm
OWIwODc1NWVhMTMyNzQzNTJkCiMgYmFkOiBbYWU0YmExOTM2YWI5N2M2YTI3MzNhMjQzMzcwZjMw
M2RhM2MxMTgzOV0gZHJtL3N1bjRpOiBmcm9udGVuZDogRGV0ZXJtaW5lIGlucHV0IG1vZGUgYmFz
ZWQgb24gdGhlIG51bWJlciBvZiBwbGFuZXMKZ2l0IGJpc2VjdCBiYWQgYWU0YmExOTM2YWI5N2M2
YTI3MzNhMjQzMzcwZjMwM2RhM2MxMTgzOQojIGJhZDogW2IzOWI1Mzk0ZmFiYzc5YWNiYWFmYjI2
Yjc3N2ZkMzQ4Yzg2OGJmN2VdIGRybS9nZW06IEFkZCBkcm1fZ2VtX29iamVjdF9mdW5jcwpnaXQg
YmlzZWN0IGJhZCBiMzliNTM5NGZhYmM3OWFjYmFhZmIyNmI3NzdmZDM0OGM4NjhiZjdlCiMgYmFk
OiBbN2RiNjQ3YWE4YjEzNDA1OWMzYjhmMjZiMWRkMmUxYWE1YjkxZTJjYV0gZHJtL21lc29uOiBB
ZGQgcHJpbWFyeSBwbGFuZSBzY2FsaW5nCmdpdCBiaXNlY3QgYmFkIDdkYjY0N2FhOGIxMzQwNTlj
M2I4ZjI2YjFkZDJlMWFhNWI5MWUyY2EKIyBiYWQ6IFtlYjhkZDNhYmViNGRmZmFiNmMzNzNlODdk
MDlmYzNiNTg1OGFjMTU4XSBkcm0vdmM0OiBQcmVmZXIgUFBGIG92ZXIgVFBaIHdoZW4gZHN0ID49
IDIvMyBzcmMKZ2l0IGJpc2VjdCBiYWQgZWI4ZGQzYWJlYjRkZmZhYjZjMzczZTg3ZDA5ZmMzYjU4
NThhYzE1OAojIGJhZDogWzc4MzE5NWVjMWNhZGE4NjJkNTRkZWU4ZjMxMmE2MGJjYmJhNWMwZTRd
IGRybS9zeW5jb2JqOiBkaXNhYmxlIHRoZSB0aW1lbGluZSBVQVBJIGZvciBub3cgdjIKZ2l0IGJp
c2VjdCBiYWQgNzgzMTk1ZWMxY2FkYTg2MmQ1NGRlZThmMzEyYTYwYmNiYmE1YzBlNAojIGJhZDog
W2IyNDMyYWRmMzNlOGM4ZWI4MWFmYWJhMzAzMGYwYmEwMTQ1Y2U3ZDRdIGRybS9hdG9taWM6IFVz
ZSBleHBsaWNpdCBvbGQvbmV3IHN0YXRlIGluIGRybV9hdG9taWNfY3J0Y19jaGVjaygpCmdpdCBi
aXNlY3QgYmFkIGIyNDMyYWRmMzNlOGM4ZWI4MWFmYWJhMzAzMGYwYmEwMTQ1Y2U3ZDQKIyBiYWQ6
IFs1MzQ5MDNkNjAzNzZiNDk4OWI3NmVjNDQ1NjMwYWExMGYyYmMzMDQzXSBkcm0vYXRvbWljOiBV
c2UgZXhwbGljaXQgb2xkIGNydGMgc3RhdGUgaW4gZHJtX2F0b21pY19hZGRfYWZmZWN0ZWRfcGxh
bmVzKCkKZ2l0IGJpc2VjdCBiYWQgNTM0OTAzZDYwMzc2YjQ5ODliNzZlYzQ0NTYzMGFhMTBmMmJj
MzA0MwojIGZpcnN0IGJhZCBjb21taXQ6IFs1MzQ5MDNkNjAzNzZiNDk4OWI3NmVjNDQ1NjMwYWEx
MGYyYmMzMDQzXSBkcm0vYXRvbWljOiBVc2UgZXhwbGljaXQgb2xkIGNydGMgc3RhdGUgaW4gZHJt
X2F0b21pY19hZGRfYWZmZWN0ZWRfcGxhbmVzKCkK


--=-cTNppwRX7+7P17Ih7f4+--


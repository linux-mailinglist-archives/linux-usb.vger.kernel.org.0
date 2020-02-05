Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E02E81533B4
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2020 16:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727178AbgBEPUk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Feb 2020 10:20:40 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:46572 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727050AbgBEPUk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Feb 2020 10:20:40 -0500
Received: by mail-qk1-f195.google.com with SMTP id g195so2118723qke.13
        for <linux-usb@vger.kernel.org>; Wed, 05 Feb 2020 07:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=O7xjTlsrGGt8AilrvsCfe692gw21+JsTdoMX38JZb50=;
        b=tR6oHwVnQvcka3Lr3PBSCqgYUDVxi/4MHBUErvsK5dKxKp3iSJxOlmKV9gGn2U8uNX
         tGt8TqMVp+8pTgGh5GY7nou2qnS39B2jGXXIt5QIR1BTG5GjtCRRZSoY3lA7gOl5/dl5
         KoKkdvrOzvcD6dKN7ydIVVG+JOfIJ2iqaPPVaCc7NeOqX4JwVokp4XCngtrKOhDmdpkA
         iwdpD687vRAE9Iw3TN9/1mjZM7SjSVcnBn7u00WuKze3BHSPSmBzPvbF1DIQ51i5Obqs
         JAbvVlzQ5bkYvldYlfYGBsXTlzcmfGEKCOCtRWWuKFngztPXFYDTGIFnsGzQdQkvmM+1
         OYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to:content-transfer-encoding;
        bh=O7xjTlsrGGt8AilrvsCfe692gw21+JsTdoMX38JZb50=;
        b=k7+Hgxs7K1Otr4Xvl1DODvMnOAHnBVcwr41yz7xA0cWawPrxkOldZOKjGYdFDNEFTS
         +afZfh2eynJvfrG1wtEDRBTiSz4BWmsp+GlOrkaCps0hWC789nVtvGmoBs9cluAyqqe7
         w1PyIcNZeSN8TE6H+yD3XnYJGWhARm7h9w6i4aQ4bKi/X/l1XqtbIFeK9PMp+9057vDT
         a9w6eu0sfvw4v8mGvBGHjbjEchq3QrRSXUWElN0qCEi7jwSjqOlDxwVn4Whnzr4tL94T
         Cz1fbQNXBklLoNeDIZTaaE8ahY5k0Y6i5EpXwX5KUA67ZPVLSS3vcTtLUswephYKhWe2
         WVDg==
X-Gm-Message-State: APjAAAXcEgsexZJqlZ6HUnER9OdPiOq7ajJGUjXPmNV4SIR+1INOkIVi
        1SLRGc/wtSg/BkBgVxIeib7RROYa5+ZJRGeQKsU=
X-Google-Smtp-Source: APXvYqyWldDMMtFT4HksZ5H2Q41y+5At39TCjPxBr9u96oijcnQ/okQfychGpzI8wQ8B2A+Y2xvTex5kUdfWIsh0Ol8=
X-Received: by 2002:ae9:e70d:: with SMTP id m13mr33065164qka.245.1580916039601;
 Wed, 05 Feb 2020 07:20:39 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:aed:2437:0:0:0:0:0 with HTTP; Wed, 5 Feb 2020 07:20:38 -0800 (PST)
Reply-To: charlesdavids22@hotmail.com
In-Reply-To: <CAKRLHgPc_dVQScZa+jXBYBr=7rv+YP-iJVFOVyHYoL5rMb=RQg@mail.gmail.com>
References: <CAKRLHgPtJr1-Yxmq_K2s3Dc3YFRqEXfwpi__+u2cZZjg_XPDyA@mail.gmail.com>
 <CAKRLHgOXBwhwnx5n1q-z7xqcM_RMdLkOfzbODXLRGaJuekU-3g@mail.gmail.com>
 <CAKRLHgN4z6iyC_fr9_RDh+TymcHewd7M6GTx50p_5vAj15Y+6A@mail.gmail.com>
 <CAKRLHgN989TRgEHjXtMmEYM9nJc5Tnpsv3O2mpuDsGEeaFyiYQ@mail.gmail.com> <CAKRLHgPc_dVQScZa+jXBYBr=7rv+YP-iJVFOVyHYoL5rMb=RQg@mail.gmail.com>
From:   jerry michael <jerryichqel@gmail.com>
Date:   Wed, 5 Feb 2020 15:20:38 +0000
Message-ID: <CAKRLHgOodbSCLcWGst7b=8Fz1H95Q1LFiQGzA=1=vCyp9xZAsQ@mail.gmail.com>
Subject: Fwd:
To:     jerryichqel <jerryichqel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

LS0tLS0tLS0tLSBGb3J3YXJkZWQgbWVzc2FnZSAtLS0tLS0tLS0tDQpGcm9tOiBqZXJyeSBtaWNo
YWVsIDxqZXJyeWljaHFlbEBnbWFpbC5jb20+DQpEYXRlOiBXZWQsIDUgRmViIDIwMjAgMTU6MTI6
MTEgKzAwMDANClN1YmplY3Q6IEZ3ZDoNClRvOiBqZXJyeWljaHFlbCA8amVycnlpY2hxZWxAZ21h
aWwuY29tPg0KDQoNCtCX0LTRgNCw0LLRgdGC0LLRg9C5LCDQtNC+0YDQvtCz0L7QuSwNCg0K0JrQ
sNC6INGC0LLQvtC4INC00LXQu9CwPyDQotGLINC/0L7Qu9GD0YfQuNC7INC80L7QtSDQv9C+0YHQ
u9C10LTQvdC10LUg0L/QuNGB0YzQvNC+PyDQn9C+0LbQsNC70YPQudGB0YLQsCwg0YHRgNC+0YfQ
vdC+DQrQvtGC0LLQtdGC0YwhINCh0L/QsNGB0LjQsdC+INC30LAg0L/QvtC90LjQvNCw0L3QuNC1
Lg0KDQrQoSDQvdCw0LjQu9GD0YfRiNC40LzQuCDQv9C+0LbQtdC70LDQvdC40Y/QvNC4DQoNCtCc
0LjRgdGC0LXRgCDQlNC20LXRgNGA0Lgg0JzQsNC50LrQuw0K

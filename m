Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC8A4F8B38
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2019 10:00:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727186AbfKLJAJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Nov 2019 04:00:09 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46448 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbfKLJAI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Nov 2019 04:00:08 -0500
Received: by mail-wr1-f67.google.com with SMTP id b3so17515851wrs.13
        for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2019 01:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=BcEdIsgONewkt2WTJX4+2t/kFfSrtlzB9Hhzx9d9WmI=;
        b=pA5YX+KhNescvw+tUXCcv5VVKKi9AIRjIv3AkcK67VfqS37wRrg3m3KoyIfTB2MGOe
         38QKziEBgnXY4o50gAtIbYqvLD8wi6IaV+G/8cWXQWS5Wh3YRNzvASrSeg34mMDXqONP
         tSJ7fjBDQkdHExDQDKtvyzEN9/ry4gtWrgcmj7XIM62DjH6yZ10xb0ubeJM75/QRYMPl
         pcxOZ/u1w3dYq/wTjKgBVSU5vWOcStokbDXe4xB+8hYN+zoqlQvQesk4R7CnL4WzTM1l
         jM+uAjM0wtPGKbgtw9EWi78wPtEOY0xBNmzY7ao1fpJ5eZXUehfmvokmOM1WPpSMwxIh
         2Waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=BcEdIsgONewkt2WTJX4+2t/kFfSrtlzB9Hhzx9d9WmI=;
        b=ccbixpye7vvuIR9pRnLE6VLLK7vzeoZjbgtwXs2y3u+PzhE5IqADgRgQBzRjTps3AD
         c/u1t9WsWDlGh7sZZtp75haOePDc1JGjpo6fpdazeZgeazFcjZi5m8eXahwHBOT+O0od
         oHB1dkEGhrV1mSJ/dllZvDxyEPzKn8jrD4FE4GFbsJ3MBlz35xpVQdDCUgHZN3hx2F3v
         c3qetd7IMIpShPCiVEn7a2GkyQHF4zBDZ/ccaEVIKtVEi+NGxbyYcS6PJd1/i/lVEDEM
         R7V7mL25csD+IA788a1zohApZWeEeRCUIqEXzoaLKmC3CnvC9LgrpODbjC6yFdaQVfdE
         EWvw==
X-Gm-Message-State: APjAAAXCSyvqpJomVaunT+IPW9fSYPw7WIsQmPR3oqAyiYaS0XEwR6jI
        K3JkkXVDDmiP75KWcImIWriNIA==
X-Google-Smtp-Source: APXvYqxNt8AkoEGpgXWlnhD0dzWV63L1YNrT8HcgC0uxc+I/A2wPSFXVMKogr3tcfKYT1iW6FSbU1g==
X-Received: by 2002:a5d:6b0e:: with SMTP id v14mr23966834wrw.280.1573549203401;
        Tue, 12 Nov 2019 01:00:03 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id 189sm3464185wme.28.2019.11.12.01.00.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Nov 2019 01:00:02 -0800 (PST)
Subject: Re: [PATCH 1/3] doc: dt: bindings: usb: dwc3: Update entries for
 disabling SS instances in park mode
To:     Jun Li <lijun.kernel@gmail.com>, Tim <elatllat@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>, khilman@baylibre.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dongjin Kim <tobetter@gmail.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Rob Herring <robh@kernel.org>
References: <20191014141718.22603-1-narmstrong@baylibre.com>
 <20191014141718.22603-2-narmstrong@baylibre.com>
 <20191023201141.GA21235@bogus>
 <CA+3zgmsJPsvXgsjDQKKrSG+UNdY3SK+hKCTD2X3hGG+OXejHig@mail.gmail.com>
 <CAKgpwJWU3jB0DWEKE09TOV+YLceBFJ75ZirAXQbuhj8v3FwjXg@mail.gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <c32007f5-88b9-45c5-b542-b1dc4dbc76ea@baylibre.com>
Date:   Tue, 12 Nov 2019 10:00:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAKgpwJWU3jB0DWEKE09TOV+YLceBFJ75ZirAXQbuhj8v3FwjXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Li,

On 11/11/2019 02:58, Jun Li wrote:
> Hi Neil
> 
> As I got the information from Synopsys, this bug exists on current IP versions,
> and per my tests with external USB3 hub + 2 Super speed udisks on data
> read by dd, I can reproduce this issue with different kernel versions, also I
> didn't see obvious performance drop by dd tests after disable park mode for
> super speed, so should we just disable it by default so no need a quirk?

I don't have any opinion on this, I think the USB & DWC3 maintainers should decide
how to handle this.

Did Synopsys specified a range of affected IP version ?

Neil

> 
> Li Jun
> 
> Tim <elatllat@gmail.com> 于2019年11月11日周一 上午8:42写道：
>>
>> Thanks for working on this Neil,
>> Is there something that needs doing for this patch to make it into 5.3 or 5.4?
>> As previously mentioned the patch set fixes the issue on affected hardware;
>>     https://patchwork.kernel.org/patch/11164515/
>>
>>
>>
>> On Wed, Oct 23, 2019 at 4:11 PM Rob Herring <robh@kernel.org> wrote:
>>>
>>> On Mon, Oct 14, 2019 at 04:17:16PM +0200, Neil Armstrong wrote:
>>>> This patch updates the documentation with the information related
>>>> to the quirks that needs to be added for disabling all SuperSpeed XHCi
>>>> instances in park mode.
>>>>
>>>> CC: Dongjin Kim <tobetter@gmail.com>
>>>> Cc: Jianxin Pan <jianxin.pan@amlogic.com>
>>>> Reported-by: Tim <elatllat@gmail.com>
>>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>
>>> Sigh, what's one more to the never ending list of quirks...
>>>
>>> Acked-by: Rob Herring <robh@kernel.org>


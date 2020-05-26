Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 427FC198EC3
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2020 10:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729624AbgCaIo4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 04:44:56 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43604 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbgCaIoz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Mar 2020 04:44:55 -0400
Received: by mail-wr1-f68.google.com with SMTP id m11so18950106wrx.10
        for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2020 01:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QIkmlfx36HGCgPU+aOqGn881RKM1Ep6+aFFH7tFDOhI=;
        b=OosQ0HCKJVJK883tMwqdytNtnisnFVTbVSAv33kEKGcShhT9KahgOg5nt4mCRZDVVj
         GRvYaWlyBOAImJgfKLpgTVPaQwj6uNrL81av2KJsd5R4hYNhVYfrqP5ZFjMitXnDns/G
         UheC/WQVjSWsWXIKVCSWP+MXhC6y5MILsaPphDT6YBIpuPnF4R+gl9YhBVdWLTDzOe7/
         ONSWh3OU63eQdVYH0ykPwoObPT18fbSjiNFKSighxXqcPG4vymeJrBCg/yYInOxBGM0E
         WDfLBaYTIK7LpMkBedjjtid6ENztVz0mUAhgLtodvYMgqZFC5kod5nZkj9aG+CH0n2l1
         M+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=QIkmlfx36HGCgPU+aOqGn881RKM1Ep6+aFFH7tFDOhI=;
        b=ROx6gaNnij8lOti+l3Fm+6JggCH7E42Y1WbAmLzScsFMfBFwM40O02zEv90FEAcDly
         Gn3gHLTspcuFe6wrLIUJLIf1sBvxPPkWtkQaor2yCKbAc2XhIKjt8q0rF5WD3sdXJaMS
         B4v8qD1yvCsWXr0peKxxXRkU3yHxfyiIRQOJ2T0J78V7h+uIr0Ow5AEj94TfmsolRNX2
         dvHG63mKloq8KI8cOtLWjjUSy+DunjsFvL6RIOZcca8oB+/fNpuP6ucijRnHidU11ciH
         OO7AlTUyKNEsgeJW+eJOvNCNufr+xoZx+wAKwyGbS9ZbBccikli9lDn9ElTMk7VxB9L/
         Uqcg==
X-Gm-Message-State: ANhLgQ0lPmpFBQIsRnsY2N11Cb29QdResOLB6KpLC0pkJz9B1BkbODCa
        /hVAY5JSGDrKot7lQQvh5/mvNrL59G9gAA==
X-Google-Smtp-Source: ADFU+vuaVOaUoT0zyHX5/tEVtCCmxjG7l+rLMxVL+7kbvA10dfu3T++VV/d1rs7v2dEU+MZhY0m9GQ==
X-Received: by 2002:adf:f3c5:: with SMTP id g5mr19054130wrp.230.1585644293987;
        Tue, 31 Mar 2020 01:44:53 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2? ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id y11sm27059194wrd.65.2020.03.31.01.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 01:44:53 -0700 (PDT)
Subject: Re: [PATCH v2 07/14] usb: dwc3: meson-g12a: refactor usb init
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200326134507.4808-1-narmstrong@baylibre.com>
 <20200326134507.4808-8-narmstrong@baylibre.com>
 <CAFBinCBhk+XvjGODBaNH7tzCfGktYdmk1wED8UC6cYmS3ucbig@mail.gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT7CwHsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIXOwU0EVid/pAEQAND7AFhr
 5faf/EhDP9FSgYd/zgmb7JOpFPje3uw7jz9wFb28Cf0Y3CcncdElYoBNbRlesKvjQRL8mozV
 9RN+IUMHdUx1akR/A4BPXNdL7StfzKWOCxZHVS+rIQ/fE3Qz/jRmT6t2ZkpplLxVBpdu95qJ
 YwSZjuwFXdC+A7MHtQXYi3UfCgKiflj4+/ITcKC6EF32KrmIRqamQwiRsDcUUKlAUjkCLcHL
 CQvNsDdm2cxdHxC32AVm3Je8VCsH7/qEPMQ+cEZk47HOR3+Ihfn1LEG5LfwsyWE8/JxsU2a1
 q44LQM2lcK/0AKAL20XDd7ERH/FCBKkNVzi+svYJpyvCZCnWT0TRb72mT+XxLWNwfHTeGALE
 +1As4jIS72IglvbtONxc2OIid3tR5rX3k2V0iud0P7Hnz/JTdfvSpVj55ZurOl2XAXUpGbq5
 XRk5CESFuLQV8oqCxgWAEgFyEapI4GwJsvfl/2Er8kLoucYO1Id4mz6N33+omPhaoXfHyLSy
 dxD+CzNJqN2GdavGtobdvv/2V0wukqj86iKF8toLG2/Fia3DxMaGUxqI7GMOuiGZjXPt/et/
 qeOySghdQ7Sdpu6fWc8CJXV2mOV6DrSzc6ZVB4SmvdoruBHWWOR6YnMz01ShFE49pPucyU1h
 Av4jC62El3pdCrDOnWNFMYbbon3vABEBAAHCwn4EGAECAAkFAlYnf6QCGwICKQkQFpq3saTP
 +K7BXSAEGQECAAYFAlYnf6QACgkQd9zb2sjISdGToxAAkOjSfGxp0ulgHboUAtmxaU3viucV
 e2Hl1BVDtKSKmbIVZmEUvx9D06IijFaEzqtKD34LXD6fjl4HIyDZvwfeaZCbJbO10j3k7FJE
 QrBtpdVqkJxme/nYlGOVzcOiKIepNkwvnHVnuVDVPcXyj2wqtsU7VZDDX41z3X4xTQwY3SO1
 9nRO+f+i4RmtJcITgregMa2PcB0LvrjJlWroI+KAKCzoTHzSTpCXMJ1U/dEqyc87bFBdc+DI
 k8mWkPxsccdbs4t+hH0NoE3Kal9xtAl56RCtO/KgBLAQ5M8oToJVatxAjO1SnRYVN1EaAwrR
 xkHdd97qw6nbg9BMcAoa2NMc0/9MeiaQfbgW6b0reIz/haHhXZ6oYSCl15Knkr4t1o3I2Bqr
 Mw623gdiTzotgtId8VfLB2Vsatj35OqIn5lVbi2ua6I0gkI6S7xJhqeyrfhDNgzTHdQVHB9/
 7jnM0ERXNy1Ket6aDWZWCvM59dTyu37g3VvYzGis8XzrX1oLBU/tTXqo1IFqqIAmvh7lI0Se
 gCrXz7UanxCwUbQBFjzGn6pooEHJYRLuVGLdBuoApl/I4dLqCZij2AGa4CFzrn9W0cwm3HCO
 lR43gFyz0dSkMwNUd195FrvfAz7Bjmmi19DnORKnQmlvGe/9xEEfr5zjey1N9+mt3//geDP6
 clwKBkq0JggA+RTEAELzkgPYKJ3NutoStUAKZGiLOFMpHY6KpItbbHjF2ZKIU1whaRYkHpB2
 uLQXOzZ0d7x60PUdhqG3VmFnzXSztA4vsnDKk7x2xw0pMSTKhMafpxaPQJf494/jGnwBHyi3
 h3QGG1RjfhQ/OMTX/HKtAUB2ct3Q8/jBfF0hS5GzT6dYtj0Ci7+8LUsB2VoayhNXMnaBfh+Q
 pAhaFfRZWTjUFIV4MpDdFDame7PB50s73gF/pfQbjw5Wxtes/0FnqydfId95s+eej+17ldGp
 lMv1ok7K0H/WJSdr7UwDAHEYU++p4RRTJP6DHWXcByVlpNQ4SSAiivmWiwOt490+Ac7ATQRN
 WQbPAQgAvIoM384ZRFocFXPCOBir5m2J+96R2tI2XxMgMfyDXGJwFilBNs+fpttJlt2995A8
 0JwPj8SFdm6FBcxygmxBBCc7i/BVQuY8aC0Z/w9Vzt3Eo561r6pSHr5JGHe8hwBQUcNPd/9l
 2ynP57YTSE9XaGJK8gIuTXWo7pzIkTXfN40Wh5jeCCspj4jNsWiYhljjIbrEj300g8RUT2U0
 FcEoiV7AjJWWQ5pi8lZJX6nmB0lc69Jw03V6mblgeZ/1oTZmOepkagwy2zLDXxihf0GowUif
 GphBDeP8elWBNK+ajl5rmpAMNRoKxpN/xR4NzBg62AjyIvigdywa1RehSTfccQARAQABwsBf
 BBgBAgAJBQJNWQbPAhsMAAoJEBaat7Gkz/iuteIH+wZuRDqK0ysAh+czshtG6JJlLW6eXJJR
 Vi7dIPpgFic2LcbkSlvB8E25Pcfz/+tW+04Urg4PxxFiTFdFCZO+prfd4Mge7/OvUcwoSub7
 ZIPo8726ZF5/xXzajahoIu9/hZ4iywWPAHRvprXaim5E/vKjcTeBMJIqZtS4u/UK3EpAX59R
 XVxVpM8zJPbk535ELUr6I5HQXnihQm8l6rt9TNuf8p2WEDxc8bPAZHLjNyw9a/CdeB97m2Tr
 zR8QplXA5kogS4kLe/7/JmlDMO8Zgm9vKLHSUeesLOrjdZ59EcjldNNBszRZQgEhwaarfz46
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <aaea637a-4fef-9914-16f5-5b71458bd7e4@baylibre.com>
Date:   Tue, 31 Mar 2020 10:44:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCBhk+XvjGODBaNH7tzCfGktYdmk1wED8UC6cYmS3ucbig@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 27/03/2020 00:26, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Thu, Mar 26, 2020 at 2:45 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> [...]
>> -static int dwc3_meson_g12a_usb2_init(struct dwc3_meson_g12a *priv)
>> +static int dwc3_meson_g12a_usb2_init(struct dwc3_meson_g12a *priv,
>> +                                    enum phy_mode mode)
>>  {
>>         int i, ret;
>>
>> -       if (priv->otg_mode == USB_DR_MODE_PERIPHERAL)
>> -               priv->otg_phy_mode = PHY_MODE_USB_DEVICE;
>> -       else
>> -               priv->otg_phy_mode = PHY_MODE_USB_HOST;
>> -
>>         for (i = 0; i < priv->drvdata->num_phys; ++i) {
>>                 if (!priv->phys[i])
>>                         continue;
>> @@ -284,9 +286,10 @@ static void dwc3_meson_g12a_usb3_init(struct dwc3_meson_g12a *priv)
>>                         FIELD_PREP(USB_R1_P30_PCS_TX_SWING_FULL_MASK, 127));
>>  }
> There is something strange with dwc3_meson_g12a_usb2_init.
> enum phy_mode mode is added here but it's not used inside this function

You are right...

> 
> I also think that we should not pass enum phy_mode to
> dwc3_meson_g12a_usb_otg_apply_mode
> I'm aware that the original function used enum phy_mode inside but
> this doesn't seem right:
> we're not configuring a PHY there
> instead we're setting up the OTG switch so I think we should use enum
> usb_role instead

Indirectly yes, we setup how the phy_mode is set in the glue, and passing
usb_role will need an useless conversion in dwc3_meson_g12a_usb_init_glue
also calling dwc3_meson_g12a_usb_otg_apply_mode.

> 
> [...]
> not part of this patch but should be:
> there's a still a direct call to dwc3_meson_g12a_usb_init() in
> dwc3_meson_g12a_resume()
> I think that needs to be changed to priv->drvdata->usb_init(priv); as well
> 

Indeed, I'll fix that.

Again, thanks for reviewing !

Neil

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C88BAD17E3
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 20:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730490AbfJIS5Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 14:57:16 -0400
Received: from mail-yw1-f51.google.com ([209.85.161.51]:35821 "EHLO
        mail-yw1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729535AbfJIS5Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 14:57:16 -0400
Received: by mail-yw1-f51.google.com with SMTP id r134so1214980ywg.2
        for <linux-usb@vger.kernel.org>; Wed, 09 Oct 2019 11:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=4OZr2wWL+LlBh6IOfDlMjWQ1iaUqL+Svc4UGJ5r3Efc=;
        b=j8l9+aR8nUi5K8d1Yci+OZfCPRmfmFMIJ4aIq/bi0ZaauI+ZwbvkJa6eflJqoRs1yr
         Meil4IgRYQKhcuYnYO9XHYA/13tXStf35S9iDu/6SXV0rqN8d0YtJQ0qjcXuFW2wZThJ
         vzWEF0XdhwKsbTcvdP9OdvaLWEF9nIKEqIHl3WwVEwaMbdHpQqbRfHoXgZXV2yUDGuJE
         BBY6hs0gBufT7RPqeVNCfZ2KETTraQbhkpdXR25dr1my+z0vh6mumAXf/MeeVS1ls8DS
         zAC4lH2hTuorl3LNzUZWkRcimKng0pOGH/Q+GOm03NgzIG228Ry71Mc2p48K2TtGl/99
         f9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=4OZr2wWL+LlBh6IOfDlMjWQ1iaUqL+Svc4UGJ5r3Efc=;
        b=ZpZbV6q3IETuVOzO3LoxanTAKd7GI19ALLdsIPCWBvJEmt2OeqAIa/LUYSTMUM8b78
         SfARpQpmUkD53wSqKWBBEjvJnH4MQ8CQssa18ncc95oLu0wxJvSBjiqRp59m3I1SVW0a
         abo4yrKjvOuqam6DO/tUz2rVhfWC1A8Pj87KWABc/AyWlArM7g7uno3Tz9XZO/hfX1ZH
         YLJgAQ6/LdYy2m2KiARqGRRfkV05XbvlqD33DIFVsuEQrp/hIFl/c6ewElNVqt4+SJY+
         mXqdJe0cvYvxSrGvn1eojZFt8+n0vgsrHXQHDyFKo7b+SkCjq8zRKhtmsugL7sgmCFhV
         LwYQ==
X-Gm-Message-State: APjAAAXIoiekEzdILvapKMQ90qXNT6yRnfwplUj27U/y1Fc3y/7LQwUC
        quxPd3HvVmKDN4Ez1FaGiHw2rOTe
X-Google-Smtp-Source: APXvYqxUAYWkH1HGEvoQOdw6sNQwQ2iqXwQ2gdo2hDoQ5kdShvxKiSLNwTXYsYg4qZbCaW9gSbg1GQ==
X-Received: by 2002:a0d:c144:: with SMTP id c65mr3815433ywd.218.1570647435427;
        Wed, 09 Oct 2019 11:57:15 -0700 (PDT)
Received: from [192.168.1.105] (ip68-4-180-157.oc.oc.cox.net. [68.4.180.157])
        by smtp.gmail.com with ESMTPSA id g40sm740005ywk.14.2019.10.09.11.57.14
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 11:57:15 -0700 (PDT)
Subject: Re: Etron EJ168A controller
To:     linux-usb@vger.kernel.org
References: <91b55846-130e-a0b7-c516-5fa49ad60067@gmail.com>
From:   Kenneth <x.xeroid@gmail.com>
Message-ID: <38481a5a-4ea5-a166-917a-98dfa1accad8@gmail.com>
Date:   Wed, 9 Oct 2019 11:57:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <91b55846-130e-a0b7-c516-5fa49ad60067@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I was informed that there were bug fixes for the Etron EJ168A controller in kernel 5.2 and 5.3

While I can read most USB sticks, if I connect an android phone to this port, applications hang trying to access the phone.

MX Linux Form Topic = Android phone hangs with USB 3.0

Kenneth


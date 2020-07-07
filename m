Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 136F1216F40
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 16:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728259AbgGGOsb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 10:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726946AbgGGOsb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jul 2020 10:48:31 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C663C061755
        for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2020 07:48:31 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id r12so45380047wrj.13
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2020 07:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=JzPHVkwxPeNm9siNX/pfXdzPUOVk711v5fUyNIxljXs=;
        b=Cukjho0QSDSP82povLStXX16+KZC2FeZJjysYR/otvQr7jDcwPm7byDb7B9Z2piOKv
         7zYKmoG3Ya5po5FoSmLdNT4SYAUqw6LHrew566FOukcdm1HawT14bzR7bh4UYmgvGXZ8
         dNcjEC05vIaRIBK8zvJkfHx+OzakvVZv/opK4yzxhD7K3Wf5Jeh+hJUauRrivano6rQc
         AJAa686hp5MAmRylo7p1oPZZP9vUGoUlaFxRoDvJW+CIQdaqABfMOLkAQ8D30hJX++ou
         O/Glzlycmh7h1BcuewQOQn6YSfKSKV6sB9M0+wCqhPAza4JPYzYPtM1P57mlQ8fA7Gsp
         Z15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=JzPHVkwxPeNm9siNX/pfXdzPUOVk711v5fUyNIxljXs=;
        b=NBM6pEXWEISIZym4EMnBkHgmHXHrmTWlx6rB0C9RyQ7acsLuGIdIcwiywarO2or5SW
         e0wfbDUPutL33T7+OYw09SyyKek6euvBWDfJkLvfRHVQIUPtjYsmZWD2spV5UiupWvqi
         6tdbsQNMhPlt0bSPDaBo3lnlI6fMtDhwJVfffPLeF0RtiCmA5ea3x4vvrt37XvEw0VDE
         HCyBjDocOz/YjK+37W0TnXg30IKpV1xXTA+olNjzEMqvaDUPDKEQ75mIGLZYG9g/lk2w
         eS5+Xx9wXqSXWPQ/rQelnp1ewWq4XbyNjQzFzTXLaNe1bYg09W4lZodLVlXJHvd/aVeY
         3wZw==
X-Gm-Message-State: AOAM531RKSl1W2lpyYvshwm3UyvVq5FZ4kUvjCM02cYlLJlvCf91POn4
        HaWpEZZyWRviqsFZO3A=
X-Google-Smtp-Source: ABdhPJwFdukdjJWeecwE4XkVglTKrRNzNFhYnU7/GKoKIp91D9t60lZDKw+gTXG5nxP2FbSeB7YTYA==
X-Received: by 2002:adf:ea0f:: with SMTP id q15mr24341792wrm.113.1594133310081;
        Tue, 07 Jul 2020 07:48:30 -0700 (PDT)
Received: from [192.168.25.100] (ip-176-198-223-130.hsi05.unitymediagroup.de. [176.198.223.130])
        by smtp.googlemail.com with ESMTPSA id q5sm1272729wrp.60.2020.07.07.07.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2020 07:48:29 -0700 (PDT)
To:     Johan Hovold <johan@kernel.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From:   =?UTF-8?Q?Frank_Sch=c3=a4fer?= <fschaefer.oss@googlemail.com>
Subject: read() from removed usb-serial device
Message-ID: <4f43f7ac-33ea-df67-f623-a7edc3d14c4c@googlemail.com>
Date:   Tue, 7 Jul 2020 16:49:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I recently noticed that read() from a usb-serial device does not fail 
after the device got removed.
Is this really the correct/expected behavior or a bug ?

I would expect it to return -1 and set an appropriate errno, but it 
returns 0 (no error, no bytes read) instead.

According to the glibc developers "glibc just calls into the kernel and 
reports back whatever it receives from there."

Regards,
Frank


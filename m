Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 997221739CF
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2020 15:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgB1O0e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Feb 2020 09:26:34 -0500
Received: from mail-lj1-f181.google.com ([209.85.208.181]:42186 "EHLO
        mail-lj1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbgB1O0e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Feb 2020 09:26:34 -0500
Received: by mail-lj1-f181.google.com with SMTP id d10so3506531ljl.9
        for <linux-usb@vger.kernel.org>; Fri, 28 Feb 2020 06:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language;
        bh=GXPcSl5cuThD5HcnDbbOQjt0yuv/35mXS88kOAnExuU=;
        b=BuEa0yYGDa1uaOGiCRlVLbMUFFKLWL2bBjXXqo8nTCu2zgUUw4bSzJZrDKx6rylOJs
         8b00XAKZt2AQEUGuNhqkXXi4FegXVLchddYs0kpTDIEsYd/ftVckNS/RzAq6TLH6COcz
         1RU28XfU8ipsu8HTB2wkAbTShYlnYqjd6NUHcBOOh+v3qTlIMv2fFhnoJmpuzpj/AruB
         EwjMeBVD0tpYmKtt6BnoUPvrXGjAOz6pG5H86MkJkawkJ5JtNensWHiWeX33t2Ks3pE5
         ocUlZqXbalsNkkSLf0xdHa4QZtXI4Wu+XvJV+jpNwJCecjKWjfOLCOvOP1PCvil3/zuU
         aPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language;
        bh=GXPcSl5cuThD5HcnDbbOQjt0yuv/35mXS88kOAnExuU=;
        b=CItw82l+pB3X+ohYDft//QTGLPd0mwWN14MAW9+J+n3yr6BrAzu1jFpZ0B21012Goj
         xTDds5ASQJQ/zktHKwwc1wheIsinNOGXmWGWkeiUuqJIaSOp+pMckxfnjZ4aGHdaWIvv
         Txg84feOYlB4NVV1huJDetSApepikCzzCtN/IkwhqeTp9dy50tSowSaYnDWi8g4p54eM
         A6k9907IadOyX6dL5iE2YC/1yPmiswyWgEBtMW2wX+ePI4xcjdqR7gKf/ol7KySSux33
         oEkFq3GGRHni51YJR45XTYth5+Ax5FrCPkUpSnOHHCyIPWCCvJvBfUzXbgedMMAl4Ory
         ZGuQ==
X-Gm-Message-State: ANhLgQ3q9aFgVAN20AEa8nK9J3+wuntpZIzluPgNiNpqtSLAWqVDjjRt
        HI0uzb3VxnslyYLEBPpAbkYs6h23
X-Google-Smtp-Source: ADFU+vuJ3TtB3xS6yh7T94a+Utjjzj75PWhIOIokU8TrOFfy01030xVKwEsGI8t/QQWoFydwaSWNhQ==
X-Received: by 2002:a2e:a551:: with SMTP id e17mr3160890ljn.86.1582899991942;
        Fri, 28 Feb 2020 06:26:31 -0800 (PST)
Received: from [192.168.1.14] ([89.109.10.26])
        by smtp.gmail.com with ESMTPSA id i4sm5746234ljg.102.2020.02.28.06.26.30
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2020 06:26:31 -0800 (PST)
To:     linux-usb@vger.kernel.org
From:   Igor Filippov <igorf777@gmail.com>
Subject: driver
Message-ID: <20f1edf4-f589-2b04-8353-d02bb87d251a@gmail.com>
Date:   Fri, 28 Feb 2020 17:26:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------16D10D6DA25F3227DADB876A"
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------16D10D6DA25F3227DADB876A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello!

I use the USB2CAN converter i-7565H1 (from ICP CON) and the driver 
installation script from the delivery kit (in the attachment).

And the dmesg comand output is:

[  489.495739] usbcore: registered new interface driver usbserial_generic
[  489.495747] usbserial: USB Serial support registered for generic
[  489.590087] usbserial_generic 3-3:1.0: The "generic" usb-serial 
driver is only for testing and one-off prototypes.
[  489.590088] usbserial_generic 3-3:1.0: Tell linux-usb@vger.kernel.org 
to add your device to a proper driver.
[  489.590090] usbserial_generic 3-3:1.0: device has no bulk endpoints
[  489.590106] usbserial_generic 3-3:1.1: The "generic" usb-serial 
driver is only for testing and one-off prototypes.
[  489.590107] usbserial_generic 3-3:1.1: Tell linux-usb@vger.kernel.org 
to add your device to a proper driver.
[  489.590108] usbserial_generic 3-3:1.1: generic converter detected
[  489.590208] usb 3-3: generic converter now attached to ttyUSB0

Can you solve this problem? Thank You.


--------------16D10D6DA25F3227DADB876A
Content-Type: application/zip;
 name="I7565H1H2_install.zip"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="I7565H1H2_install.zip"

UEsDBBQDAAAIACFQVk707V3KJQIAANIFAAARAAAASTc1NjVIMUgyX2luc3RhbGy9lN9v2jAQ
x5/nv+LqouUpmERik1aFqQ1oROtolUL3ME0hsR2wmh/ITtgq7Y9fIMGEwiq0h/rxfOfv3ee+
yeUFiURG1BLd3F67X2+9h6lDeEFJmrOVzCPeZSRKQvqUCFV0aZ7FaPZwE3wZTUa+5waT0Xdv
6BD1rEhUKlKqyFRcijAhTIo1l4oseFYFKMn4r0Aw9DiaDO98x7CiPjXQ2Aru/bvhzJ06Rs/u
WVXEPojYBkIihh+AOxYGB4wlT1YG/LyCYskz9I7TZQ7YPPPgXUGpwgX/BF3ifex/6I+tSlVk
qgiTRKdAfbw6DNtEc2yRsQ0VmjLhUE8IYVnkaVgIWqU9n6EAkqf5mr8U8rfRtk4jcM6TlNEg
pOnpN3e3EMs8hf0yN9m/RYF4ckC4bq/FeOcEMCVUC673e7q2UWoVK87AFGCQ5oowAzraas0r
sUDoki45fQJhtgA88ozlErwhxEKqAtGwgHksMgYbx4GZhSkHweq0OfyBheQr6NQegwEQxtck
KytA9uC9hfzRdOZPHNz5jLWr6ti2eevIV5P8sJ84LzN20XC72rbtDt3g2v3mzDfSmjTej4jn
WqvJ3Yhh/FJL70UvEwaDNqr2HnY5NbnGBTtDYr0k3HDTlfrmmDfcy8rWtKho/4tzk7EHvf98
X4d9zLp3xNo7HCLO5b63rjZ2s9u2NIYK09E/6ZSn7P+a0X6TGe1TM9qvzwjbIesiVVLKlape
+QtQSwECPwMUAwAACAAhUFZO9O1dyiUCAADSBQAAEQAkAAAAAAAAACCA7YEAAAAASTc1NjVI
MUgyX2luc3RhbGwKACAAAAAAAAEAGACA9HNefMrUAQD8cmlE7dUBgIgl4kPt1QFQSwUGAAAA
AAEAAQBjAAAAVAIAAAAA
--------------16D10D6DA25F3227DADB876A--

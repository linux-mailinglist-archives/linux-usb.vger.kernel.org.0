Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 416867184A
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2019 14:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731961AbfGWMbU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jul 2019 08:31:20 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:53085 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbfGWMbU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Jul 2019 08:31:20 -0400
Received: from [192.168.0.144] ([85.219.89.53]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MoNMu-1iDu2R02Zs-00orej for <linux-usb@vger.kernel.org>; Tue, 23 Jul 2019
 14:31:19 +0200
From:   Frank Bergmann <frank.bergmann@project-open.com>
Subject: High-Impact: xhci_hid - "Not enough bandwidth for new device state"
To:     linux-usb@vger.kernel.org
Message-ID: <27f21154-659d-67b5-ac90-b931695614c8@project-open.com>
Date:   Tue, 23 Jul 2019 14:31:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:VIr6EaXMlYLtDiiEWpOnOK6oXx7hC6LHjeiBCt8v3oY9OYS9Mxr
 PwsKKRmVWg8M7G9TGpUGA2l43FqM3IxexOeQNbOeNcuWBiLAsXFGsbwgBgZLftsansFa5H9
 4H07mGPJE6GYfAThibbNp7alMsoV/byFLJdDKqV45ofiU5k3crww7JxpJLlGtLeXSl6CVOn
 x/ap8GQ7RrJrLDoSIi3Tg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kV4KYucnQ7I=:/4k/tdtdgP1wivJyA+k7aJ
 XO3Rsk9xV1eoVTfKAAnmluIIGR9+VrA1MnvEv9VeFpkyaAcueUI/AP6QMRFIxLLg9ih0aOVqN
 8CBK8NyJXGqjwL+bCALZzxK4cDYdGjppybJeZYIXgqaob80ziplOYJ9SicaYEiZyYNisf2Kpk
 GFwTVh4w5Y1kl05nBRLBgTrfj/FX+O0m0VtFZiTiBpD6IeKynKYeRBL835h5/D0FbEFxmKtaR
 sEZLrWqdvZpVJbj/CUeE32EQ2VvaQdAThy0zJA00wwHMWTeAOqJfmRFf6vxwGXcn+Qti6JE9W
 vrUiVYKv2Z7oSjc/4q+lcc4lOAghMRqPukKefEVORKZm4TvbtDV0wQSONDz52BW1VKwvgttUl
 HQJx821WAvCCir3Pl8/PyZqwOhdHV0zE/9mixigYicWMP5BI4wRwAtf1JIquairEvA2dD2Efm
 AJ9wWJf729ZCNivwjwQ9cjawKz49hd7jeO+AHn8FU89JacgOVEZ+URxzX9bSf0pypDMm9Rslq
 mSPcpJMeqnU8u4g+RbhX7FCdMcmpYGDgiHPhZNktuqk14ObSLYOadA6apbP5xoVg9AXwT9CW3
 2lhhRn0FqaXk7EBUbYgPHpoXwGRjgLbz5WpVcWG3x+iyfnSHqN1E7ceAZfssfMEng7QQ+hVvF
 EvzvoqdrVtSGM+KvgcBkxEEiC2KaUYWbgTMQCUQFYQPhjukR4GW1WYGa3t9VjL6ZL57OBGzqt
 hxiGnWojz7QMrzObgJvuNaQ9KyDk8CvoEe75hfxDeun/9aP8oB2N9sFRSww+iB0Gnca746Hby
 G0ERb4G
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear Linux-USB,


https://bugzilla.redhat.com/show_bug.cgi?id=1411604

- This bug is around since 5 years.

- Severity: High

- "It's not Fedora specific, it's linux in general"


There are 671 results in Google for 'USB "Not enough bandwidth for new 
device state"'. Why does nobody take this on?


I offer to send you or whoever a Logitech C922 WebCam if it accelerates 
the process :-)


The bug basically keeps people from using a USB 3.0 WebCam in parallel 
to some virtual machine Audio. This means it will affect any 
"professional" users who need to do GoToMeeting or WebEx together with 
running a Windows VM.


I've posted in AskUbuntu.com:
https://askubuntu.com/questions/1149160/what-to-do-with-usb-webcam-not-enough-bandwidth-for-new-device-state-issue


Thanks
Frank


Frank Bergmann
Dipl.-Ing., MBA
Founder ]project-open[
Tel: +34 932 202 088 (Spain)
Tel: +1 415 429 5995 (USA)
Cell: +34 609 953 751
Fax: +34 932 890 729

mailto:frank.bergmann@project-open.com
http://www.project-open.com
http://www.twitter.com/projop
http://www.facebook.com/projectopen.org
http://www.linkedin.com/in/fraber
http://www.xing.com/profile/Frank_Bergmann23



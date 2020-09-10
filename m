Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 531582644F9
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 13:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730083AbgIJLBg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 10 Sep 2020 07:01:36 -0400
Received: from mail2.bemta24.messagelabs.com ([67.219.250.122]:56460 "EHLO
        mail2.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730744AbgIJK7b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Sep 2020 06:59:31 -0400
Received: from [100.112.135.89] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-b.us-west-2.aws.symcld.net id 75/F5-22172-0170A5F5; Thu, 10 Sep 2020 10:59:28 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRWlGSWpSXmKPExsVyKz0mWJefPSr
  e4MwxC4sZO/tZLD4e/cRscWiihsXxztVMFmsfTmK0mPC+i8WiseEfq8Wq1VeZLc5s3Mtk8Wtr
  ocWzXVPZLb4dPcZmsWhZK7NFZ/8kVovmux3MFjNWfWW3+Pr3OLPFv/47zBY79l9nteh80sPiI
  OJxf/dKdo/JTzYyecx88YTdY+nc1eweO2fdZff48DHO4+mEyewe/Qf+MHksehzssWHmbUaPNf
  fzPE4+bWHyaNkv5vF5k5zH7WfbWDwm3HjMGCAQxZqZl5RfkcCa0TnjIFvBa/aKM/O7WBsYH7F
  1MXJxCAksYZT4OeMLSxcjJwezgJ7EjalT2EBsXgFBiZMzn0DFtSWWLXzN3MXIAWSrSXztKgEJ
  CwtwS3Sf+MsOEhYR4JP4eD8AJMwmICqxbdMJsGoWAVWJxWvMQMJCQObtd0sYQWwJAXuJpe8vQ
  NmSEk9uT2aEWOou8XjTE7CJQgL8EhNuV01g5JuF5LRZSE6bheS0WQinLWBkWcVokVSUmZ5Rkp
  uYmaNraGCga2hopGtobALEZnqJVbpJeqXFuuWpxSW6RnqJ5cV6xZW5yTkpenmpJZsYgTGeUtD
  WsYNx+psPeocYJTmYlER5ZW5HxgvxJeWnVGYkFmfEF5XmpBYfYtTj4BC4cPbhJ0aBKx8+NTFJ
  seTl56UqSfAevgtULViUmp5akZaZA0xJMA0SHDxKIrw894DSvMUFibnFmekQqVOM3hwbj85bx
  MyxHUweA5P9axYDyZc7lwDJw7uBpBDYBilxXieQDQIgIzJK8+AWwFLrJUZZKWFeRgYGBiGegt
  Si3MwSVPlXjOIcjErCvPIgU3gy80rg7ngFdCIT0ImN8mAnliQipKQamFjVZ6yalXC3+Xnwt2U
  HLm2LLl+tuzvlVwHnoVIW9d6euYqpDtqv52meaOo6/X7Cu5NxHN8W/Z0VvvT3LokXnj3/kgtY
  7NXn1K4y9276Evb33t3n4cf8X7VdUVq+YfX253P4rv9LD+GPPsCewOTwYPJepn8B7C9qih4+n
  eUuusF/W9hZX5mT+5ru3Z568eCPKC7j69MZ2HS/Cwve7H1aru3AdZJR4fCnxf4OSyJcJ2hL1E
  7iaKjlannBI3hfK7PrVPdb25btXNn/LU1ruYpavkWtWMde2LBgBieLoeFr0UIfzni7JT+s9+x
  aENzssNFrS9mKmE1L99ScC6tRXbI47Yvcgnin2gcXPpy0M5/OIKXEUpyRaKjFXFScCAAVt51l
  KAQAAA==
X-Msg-Ref: server-32.tower-345.messagelabs.com!1599735503!396249!79
X-Originating-IP: [218.103.92.83]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11681 invoked from network); 10 Sep 2020 10:59:27 -0000
Received: from 083.92.103.218.static.netvigator.com (HELO fksex.fkdomain.local) (218.103.92.83)
  by server-32.tower-345.messagelabs.com with SMTP; 10 Sep 2020 10:59:27 -0000
Received: from [172.20.10.4] (102.80.141.101) by fksex.fkdomain.local
 (192.168.1.9) with Microsoft SMTP Server (TLS) id 8.2.255.0; Thu, 10 Sep 2020
 18:59:09 +0800
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Description: Mail message body
Subject: Re
To:     Recipients@vger.kernel.org
From:   Stefano@vger.kernel.org, Pessina@vger.kernel.org
Date:   Thu, 10 Sep 2020 03:58:48 -0700
Reply-To: stefanopessina679@yahoo.com
X-Antivirus: Avast (VPS 200910-0, 09/09/2020), Outbound message
X-Antivirus-Status: Clean
Message-ID: <41435acf-259a-433e-a1a9-17b8ae5c9b18@fksex.fkdomain.local>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hallo,

Ich bin Stefano Pessina, ein italienischer Wirtschaftsmagnat, Investor und Philanthrop. der stellvertretende Vorsitzende, Chief Executive Officer (CEO) und der größte Einzelaktionär der Walgreens Boots Alliance. ich gab
25 Prozent meines persönlichen Vermögens für wohltätige Zwecke wegbringen. Und ich habe auch zugesagt, den Rest von 25% in diesem Jahr 2020 wegen des Herzschmerzes von Covid-19 an Einzelpersonen zu verschenken. Ich habe beschlossen, Ihnen 950.000,00 USD (neunhundertfünfzigtausend Dollar) zu spenden. Wenn Sie an meiner Spende interessiert sind, kontaktieren Sie mich für weitere Informationen. über meine E-Mail an (stefanopessina679@yahoo.com)

Sie können auch mehr über mich über den unten stehenden Link lesen

https://en.wikipedia.org/wiki/Stefano_Pessina

Herzlicher Gruss
CEO Walgreens Boots Alliance
Stefano Pessina

-- 
This email has been checked for viruses by Avast antivirus software.
https://www.avast.com/antivirus


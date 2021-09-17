Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6856B40F6B6
	for <lists+linux-usb@lfdr.de>; Fri, 17 Sep 2021 13:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343947AbhIQL3J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Sep 2021 07:29:09 -0400
Received: from [49.81.129.78] ([49.81.129.78]:53081 "EHLO kh55hq.top"
        rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
        id S1343944AbhIQL3I (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Sep 2021 07:29:08 -0400
X-Greylist: delayed 1202 seconds by postgrey-1.27 at vger.kernel.org; Fri, 17 Sep 2021 07:29:07 EDT
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim; d=kh55hq.top;
 h=Message-ID:From:To:Subject:Date:MIME-Version:Content-Type:Content-Transfer-Encoding; i=info@kh55hq.top;
 bh=ujj/aRwZXNQquyXAPMJ++SIlTdA=;
 b=PNTi1aooB80fzdphcJx42ytTfz0xR67fWIOqMex5i3sPeylICY+jq91FiCkfpkUPAqISBNPPCDjf
   0F6FH5Lgbe/v+XmuYovqCJTs+mjN5Vrq8e9A+BKyAYVrF8zPPHK/e64FQrTLRkrbN7kAbDBPSpF2
   +Di7DgY5jGIkV5CyTZg=
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=kh55hq.top;
 b=bQutUkEUPzdky7g3A2q6gk6/Lm4V7rjCSK0IpYXMG2gEX7lEgT7JLicFSuTuMPtDyYf80ra79brC
   VrjuMpi+RH8PqVWqDuiCS0LfVtw4P4IZPdpNPgz6YkfvYieRrSEM1ZbIZojba3pkhIeqF3eXm3As
   Vd+ZjUyrwb7yBXAEJnA=;
Message-ID: <20210917190720156475@kh55hq.top>
From:   =?utf-8?B?77yl77y077yj44K144O844OT44K544Gu44GK55+l44KJ44Gb?= 
        <info@kh55hq.top>
To:     <linux-usb@vger.kernel.org>
Subject: =?utf-8?B?RVRD44K144O844OT44K5?=
Date:   Fri, 17 Sep 2021 19:07:06 +0800
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: base64
X-mailer: Fzsbn 9
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RVRD44K144O844OT44K544KS44GU5Yip55So44Gu44GK5a6i5qeYOg0KDQpFVEPjgrXjg7zjg5Pj
grnjga/nhKHlirnjgavjgarjgorjgb7jgZfjgZ/jgIINCuW8leOBjee2muOBjeOCteODvOODk+OC
ueOCkuOBlOWIqeeUqOOBhOOBn+OBoOOBjeOBn+OBhOWgtOWQiOOBr+OAgeS4i+iomOODquODs+OC
r+OCiOOCiuips+e0sOOCkuOBlOeiuuiqjeOBj+OBoOOBleOBhOOAgg0KDQrkuIvoqJjjga7mjqXn
tprjgYvjgonlgZzmraLljp/lm6DjgpLnorroqo3jgZfjgabjgY/jgaDjgZXjgYQNCg0KaHR0cHM6
Ly9ldGMtbWVpc2FpLmpwLnRuLWluZm8udG9wDQoNCijnm7TmjqXjgqLjgq/jgrvjgrnjgafjgY3j
garjgYTloLTlkIjjga/jgIHmiYvli5Xjgafjg5bjg6njgqbjgrbjgavjgrPjg5Tjg7zjgZfjgabp
lovjgYTjgabjgY/jgaDjgZXjgYQpDQoNCuKAu+OBk+OBruODoeODvOODq+OBr+mAgeS/oeWwgueU
qOOBp+OBmeOAgg0K44CA44GT44Gu44Ki44OJ44Os44K544Gr6YCB5L+h44GE44Gf44Gg44GE44Gm
44KC6L+U5L+h44GE44Gf44GX44GL44Gt44G+44GZ44Gu44Gn44CB44GC44KJ44GL44GY44KB44GU
5LqG5om/6aGY44GE44G+44GZ44CCDQrigLvjgarjgYrjgIHjgZTkuI3mmI7jgarngrnjgavjgaTj
gY3jgb7jgZfjgabjga/jgIHjgYrmiYvmlbDjgafjgZnjgYzjgIENCiAgRVRD44K144O844OT44K5
5LqL5YuZ5bGA44Gr44GK5ZWP44GE5ZCI44KP44Gb44GP44Gg44GV44GE44CCDQoNCuKWoEVUQ+WI
qeeUqOeFp+S8muOCteODvOODk+OCueS6i+WLmeWxgA0K5bm05Lit54Sh5LyR44CAOTowMO+9njE4
OjAwDQrjg4rjg5Pjg4DjgqTjg6Tjg6vjgIAwNTcwLTAxMDEzOQ0K77yI44OK44OT44OA44Kk44Ok
44Or44GM44GU5Yip55So44GE44Gf44Gg44GR44Gq44GE44GK5a6i44GV44G+44CAMDQ1LTc0NC0x
Mzcy77yJDQowNDUtNzQ0LTIzMw==



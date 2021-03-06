Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3819D32FBFB
	for <lists+linux-usb@lfdr.de>; Sat,  6 Mar 2021 17:35:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbhCFQer (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Mar 2021 11:34:47 -0500
Received: from mout.web.de ([212.227.15.3]:42177 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230425AbhCFQef (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 6 Mar 2021 11:34:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1615048474;
        bh=c/+zNj2y6jAoxv3rIcO1D8PKvz8zStlhfFqCtlTEFKw=;
        h=X-UI-Sender-Class:To:From:Subject:Date;
        b=I6+7L3mgeU8EGbkhkfvHSZ/Xy+9ElE4fu4XyuvzC0DXca5UaAsV6X8lPYshvmprah
         jmX/v9tTAXqK6U7bD+vtpeZBzSnLLptAAShun8WR9IZZz7/9u0ZnIwO34SxgFD3War
         4gNeereomRD4gB7WIuPCjxV0rKLGUJaV+hj/68AM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.53] ([128.0.103.26]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M5j1q-1lOdM00clW-007bkS for
 <linux-usb@vger.kernel.org>; Sat, 06 Mar 2021 17:34:34 +0100
To:     linux-usb@vger.kernel.org
From:   Aaron Dewes <aaron.dewes@web.de>
Subject: A question about UAS
Message-ID: <2ad0d2f9-0ef1-05b5-76db-b178107bfccb@web.de>
Date:   Sat, 6 Mar 2021 17:34:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:j0p9pyINauV1FmPeMkpc40AYEP713znx19kLsvZfibYJUBYFtQQ
 8EL6JCCMrYw1SOTgTXUMD4PlVpyC+4zJE7VtZZnyUNvjvrD+DuqdD1PxunSBnacXtjd9cD2
 rg+0Oq0VRxZ3wqWWMMddMHWUWBY9l8qD5YKJMD0TxAPB1U78Kj8B/KwQw983MZttMTPs7yc
 hQohfBU3hSqg/aU3AJNCA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fx/aEHtaPTo=:vL7HuJ3kSGgOcoQqsaeqiD
 pyVTeJ2GuvVF22LSTNxaSLEwaUWApJS99TwcM0ssZzGIJKbkKJRuJgnoGe+rYfh0HGwMURGKf
 tz2mLfzHCRTr9IXYvdFS6+Yka3ZM0lHFdzENl8KxBBoVv2uprJ1AbbPZNE0/txmJNIrtRBnEj
 0otHxDAxuLdNVpCEQx+Pjw5JIbpDhx7FzUalW///joDGAGuUkQZM6UxkYvkbmCT/6c3OEE1vH
 Zk3dmOoq27LnAAWfIq+v3C0MjkSKiy+R5yg9pogxuVUCRkxmrQXYDx/xnsVtZxXPecCYZOKYu
 vpT0NDVh9QlaYEdnYfQ4BaT9mUB9S/XTZv+JFnEv52FbTifC99O+d7ZEivUCWSLeokqSCSudy
 rwEbOMuaKIJpZbjMByotbN7jkcdR1QP6NvDXcO4Ivi5wxtFevlN9FLUruKpGtbzjCu9T8xnqR
 pUr1pknREFm1HoTDMvIkzN9V90KZ1UELubNLzPKFMJzesJ9BGiCspJkGOswP8Z/m9rCLHJu3i
 xf8GTMivKW8mAXx7m0F0oT0T8r1DAp5/UQXIH9znmLTHy4B5XAjfVD8BIWTh6K2E3ch54/ZGw
 +z47scv+E1ERsP8Q3X1lsmgK2YsrL/0s4xkLbIxsxhUigsoHAY7RfzyK+OFtLUjOw0nX/OXUx
 sCC8I6FXK1HrZ2c5iQzrNEHFMAxxJn77EXQx2omJugVyrGzPEh2FuBP8AS58J/kD6bsfDuOPT
 WhoCwheTfAkCxN2ivjGjaUg9phXXHbnhJdSWBnUr7s9rf396usI+3fGhUx8wET8DSd/EZxlWj
 eZWXttti4qvxVYqZ9wQ7a43Pnne/TQ6CNJO8ov4JiLA0OtWHDhQtGgPoKz9umJllsMd4rDtkg
 qgmwb3ZqsqP/fOsT+tHQ==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

Sorry if this suggestion/question sounds stupid, I don't have experience
with the kernel code and this mailing list.

I'm a contributor to Umbrel (getumbrel.com), and we provide a software
that allows to run a bitcoin node easily, and we've run into many people
having UAS issues, and we were manually adding quirks in this case. Now
I'm wondering if it is possible to disable UAS for all devices in the
kernel cmdline. This is my first question, but I also have another
suggestion. We've developed the following bash script to check for UAS
issues and automatically add quirks:

=2D-----

get_uas_string () {
   UDEVADM_DATA=3D$(sudo -u umbrel udevadm test /block/${block_device} 2> =
/dev/null) # Umbrel is the  main user on umbrel, and udevadm doesn't repor=
t the vendor id if running as root, which this script is
   ID_VENDOR=3D$(echo "${UDEVADM_DATA}" | grep "ID_VENDOR_ID" | sed 's/ID_=
VENDOR_ID=3D//')
   ID_MODEL=3D$(echo "${UDEVADM_DATA}" | grep "ID_MODEL_ID" | sed 's/ID_MO=
DEL_ID=3D//')
   echo "${ID_VENDOR}:${ID_MODEL}:u"
}

if [[ $(dmesg) =3D=3D *"uas_eh_abort_handler"* ]]; then
   echo "External storage might have UAS issues"
   UAS_STRING=3D$(get_uas_string)
   if [[ $(cat /boot/cmdline.txt) =3D=3D *"${UAS_STRING}"* ]]; then
     sed "s/usb-storage.quirks=3D/usb-storage.quirks=3D$(get_uas_string),/=
g" -i /boot/cmdline.txt
     echo "Rebooting"
     sudo reboot
   fi
fi

=2D----

I was wondering if a check like this could be added to the kernel, so
every time uas_eh_abort_handler gets logged, which AFAIK only happens if
UAS has issues, a counter could be increased, so that, if it happens to
often, UAS gets disabled for that drive.

Are there any reasons not do do this because false positives could
happen? If yes, please let me know.

Aaron


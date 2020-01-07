Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 423D3132A1D
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2020 16:35:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728020AbgAGPfL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jan 2020 10:35:11 -0500
Received: from mx3.molgen.mpg.de ([141.14.17.11]:54545 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727559AbgAGPfK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Jan 2020 10:35:10 -0500
Received: from rabammel.molgen.mpg.de (rabammel.molgen.mpg.de [141.14.30.220])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id C0A702000C0A1;
        Tue,  7 Jan 2020 16:35:05 +0100 (CET)
Subject: Re: BUG: KASAN: use-after-free in
 xhci_trb_virt_to_dma.part.24+0x1c/0x80
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Greg KH <greg@kroah.com>, Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <95b4bdb2-962f-561e-ac14-79cd44395915@molgen.mpg.de>
 <20180720095410.GA11904@kroah.com>
 <107dbdd1-4e45-836f-7f8f-85bc63374e4f@molgen.mpg.de>
 <30b069b5-63f6-dd9e-b323-668f06bff6cf@molgen.mpg.de>
 <20200103110451.GJ465886@lahna.fi.intel.com>
 <81c6f906-3f5a-729d-f3b4-1ac6ac607c05@linux.intel.com>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <84369435-d355-0462-98ab-91bb1c5d3871@molgen.mpg.de>
Date:   Tue, 7 Jan 2020 16:35:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <81c6f906-3f5a-729d-f3b4-1ac6ac607c05@linux.intel.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms070508000006060207030306"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms070508000006060207030306
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Dear Mathias, dear Mika,


On 2020-01-07 13:09, Mathias Nyman wrote:
> On 3.1.2020 13.04, Mika Westerberg wrote:
>> On Thu, Jan 02, 2020 at 03:10:14PM +0100, Paul Menzel wrote:
>>> Mika, as you fixed the other leak, any idea, how to continue from the=

>>> kmemleak log below?
>>>
>>> ```
>>> unreferenced object 0xffff8c207a1e1408 (size 8):
>>> =C2=A0=C2=A0 comm "systemd-udevd", pid 183, jiffies 4294667978 (age 7=
52.292s)
>>> =C2=A0=C2=A0 hex dump (first 8 bytes):
>>> =C2=A0=C2=A0=C2=A0=C2=A0 34 01 05 00 00 00 00 00=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.......
>>> =C2=A0=C2=A0 backtrace:
>>> =C2=A0=C2=A0=C2=A0=C2=A0 [<00000000aea7b46d>] xhci_mem_init+0xcfa/0xe=
c0 [xhci_hcd]
>>
>> There are probably better ways for doing this but you can use objdump
>> for example:
>>
>> =C2=A0=C2=A0 $ objdump -l --prefix-addresses -j .text --disassemble=3D=
xhci_mem_init drivers/usb/host/xhci-hcd.ko
>>
>> then find the offset xhci_mem_init+0xcfa. It should show you the line
>> numbers as well if you have compiled your kernel with debug info. This=

>> should be close to the line that allocated the memory that was leaked.=


Thank you. I actually remembered `script/f2addr2line`.

    $ scripts/faddr2line drivers/usb/host/xhci-hcd.o xhci_mem_init+0xcfa
    xhci_mem_init+0xcfa/0xec0:
    xhci_add_in_port at /mnt/drivers/usb/host/xhci-mem.c:2161
    (inlined by) xhci_setup_port_arrays at /mnt/drivers/usb/host/xhci-mem=
=2Ec:2309
    (inlined by) xhci_mem_init at /mnt/drivers/usb/host/xhci-mem.c:2538

> Paul, it possible that your xhci controller has several
> supported protocol extended capabilities for usb 3 ports, each
> with their own custom protocol speed ID table.
>=20
> xhci driver assumes there is only one custome PSI table per roothub,
> and we will end up allocating the second PSI table on top of the first,=

> leaking the first.
>=20
> Could you boot with xhci dynamic debug enabled, and show dmesg after bo=
ot, add:
> xhci_hcd.dyndbg=3D+p
> to you kernel cmdline.
>=20
> Or as an alternative, show output of:
>=20
> sudo cat /sys/kernel/debug/usb/xhci/*/reg-ext-protocol*

`/sys/kernel/debug/` cannot be read by unprivileged users, so the wildcar=
d does
not work with `sudo`.

```
$ sudo ls /sys/kernel/debug/usb/xhci
0000:12:00.0  0000:26:00.3  0000:26:00.4
# cat /sys/kernel/debug/usb/xhci/*/reg-ext-protocol*
EXTCAP_REVISION =3D 0x03100802
EXTCAP_NAME =3D 0x20425355
EXTCAP_PORTINFO =3D 0x00000201
EXTCAP_PORTTYPE =3D 0x00000000
EXTCAP_REVISION =3D 0x03000802
EXTCAP_NAME =3D 0x20425355
EXTCAP_PORTINFO =3D 0x00000203
EXTCAP_PORTTYPE =3D 0x00000000
EXTCAP_REVISION =3D 0x02000802
EXTCAP_NAME =3D 0x20425355
EXTCAP_PORTINFO =3D 0x00190a05
EXTCAP_PORTTYPE =3D 0x00000000
EXTCAP_REVISION =3D 0x02000402
EXTCAP_NAME =3D 0x20425355
EXTCAP_PORTINFO =3D 0x00180401
EXTCAP_PORTTYPE =3D 0x00000000
EXTCAP_REVISION =3D 0x03100802
EXTCAP_NAME =3D 0x20425355
EXTCAP_PORTINFO =3D 0x10000105
EXTCAP_PORTTYPE =3D 0x00000000
EXTCAP_MANTISSA1 =3D 0x00050134
EXTCAP_REVISION =3D 0x03100802
EXTCAP_NAME =3D 0x20425355
EXTCAP_PORTINFO =3D 0x10000106
EXTCAP_PORTTYPE =3D 0x00000000
EXTCAP_MANTISSA1 =3D 0x00050134
EXTCAP_REVISION =3D 0x03100802
EXTCAP_NAME =3D 0x20425355
EXTCAP_PORTINFO =3D 0x10000107
EXTCAP_PORTTYPE =3D 0x00000000
EXTCAP_MANTISSA1 =3D 0x00050134
EXTCAP_REVISION =3D 0x03100802
EXTCAP_NAME =3D 0x20425355
EXTCAP_PORTINFO =3D 0x10000108
EXTCAP_PORTTYPE =3D 0x00000000
EXTCAP_MANTISSA1 =3D 0x00050134
EXTCAP_REVISION =3D 0x02000402
EXTCAP_NAME =3D 0x20425355
EXTCAP_PORTINFO =3D 0x00180101
EXTCAP_PORTTYPE =3D 0x00000000
EXTCAP_REVISION =3D 0x03100802
EXTCAP_NAME =3D 0x20425355
EXTCAP_PORTINFO =3D 0x10000102
EXTCAP_PORTTYPE =3D 0x00000000
EXTCAP_MANTISSA1 =3D 0x00050134
```


Kind regards,

Paul


--------------ms070508000006060207030306
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
EFowggUSMIID+qADAgECAgkA4wvV+K8l2YEwDQYJKoZIhvcNAQELBQAwgYIxCzAJBgNVBAYT
AkRFMSswKQYDVQQKDCJULVN5c3RlbXMgRW50ZXJwcmlzZSBTZXJ2aWNlcyBHbWJIMR8wHQYD
VQQLDBZULVN5c3RlbXMgVHJ1c3QgQ2VudGVyMSUwIwYDVQQDDBxULVRlbGVTZWMgR2xvYmFs
Um9vdCBDbGFzcyAyMB4XDTE2MDIyMjEzMzgyMloXDTMxMDIyMjIzNTk1OVowgZUxCzAJBgNV
BAYTAkRFMUUwQwYDVQQKEzxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVu
IEZvcnNjaHVuZ3NuZXR6ZXMgZS4gVi4xEDAOBgNVBAsTB0RGTi1QS0kxLTArBgNVBAMTJERG
Ti1WZXJlaW4gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkgMjCCASIwDQYJKoZIhvcNAQEBBQAD
ggEPADCCAQoCggEBAMtg1/9moUHN0vqHl4pzq5lN6mc5WqFggEcVToyVsuXPztNXS43O+FZs
FVV2B+pG/cgDRWM+cNSrVICxI5y+NyipCf8FXRgPxJiZN7Mg9mZ4F4fCnQ7MSjLnFp2uDo0p
eQcAIFTcFV9Kltd4tjTTwXS1nem/wHdN6r1ZB+BaL2w8pQDcNb1lDY9/Mm3yWmpLYgHurDg0
WUU2SQXaeMpqbVvAgWsRzNI8qIv4cRrKO+KA3Ra0Z3qLNupOkSk9s1FcragMvp0049ENF4N1
xDkesJQLEvHVaY4l9Lg9K7/AjsMeO6W/VRCrKq4Xl14zzsjz9AkH4wKGMUZrAcUQDBHHWekC
AwEAAaOCAXQwggFwMA4GA1UdDwEB/wQEAwIBBjAdBgNVHQ4EFgQUk+PYMiba1fFKpZFK4OpL
4qIMz+EwHwYDVR0jBBgwFoAUv1kgNgB5oKAia4zV8mHSuCzLgkowEgYDVR0TAQH/BAgwBgEB
/wIBAjAzBgNVHSAELDAqMA8GDSsGAQQBga0hgiwBAQQwDQYLKwYBBAGBrSGCLB4wCAYGZ4EM
AQICMEwGA1UdHwRFMEMwQaA/oD2GO2h0dHA6Ly9wa2kwMzM2LnRlbGVzZWMuZGUvcmwvVGVs
ZVNlY19HbG9iYWxSb290X0NsYXNzXzIuY3JsMIGGBggrBgEFBQcBAQR6MHgwLAYIKwYBBQUH
MAGGIGh0dHA6Ly9vY3NwMDMzNi50ZWxlc2VjLmRlL29jc3ByMEgGCCsGAQUFBzAChjxodHRw
Oi8vcGtpMDMzNi50ZWxlc2VjLmRlL2NydC9UZWxlU2VjX0dsb2JhbFJvb3RfQ2xhc3NfMi5j
ZXIwDQYJKoZIhvcNAQELBQADggEBAIcL/z4Cm2XIVi3WO5qYi3FP2ropqiH5Ri71sqQPrhE4
eTizDnS6dl2e6BiClmLbTDPo3flq3zK9LExHYFV/53RrtCyD2HlrtrdNUAtmB7Xts5et6u5/
MOaZ/SLick0+hFvu+c+Z6n/XUjkurJgARH5pO7917tALOxrN5fcPImxHhPalR6D90Bo0fa3S
PXez7vTXTf/D6OWST1k+kEcQSrCFWMBvf/iu7QhCnh7U3xQuTY+8npTD5+32GPg8SecmqKc2
2CzeIs2LgtjZeOJVEqM7h0S2EQvVDFKvaYwPBt/QolOLV5h7z/0HJPT8vcP9SpIClxvyt7bP
ZYoaorVyGTkwggWNMIIEdaADAgECAgwcOtRQhH7u81j4jncwDQYJKoZIhvcNAQELBQAwgZUx
CzAJBgNVBAYTAkRFMUUwQwYDVQQKEzxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1
dHNjaGVuIEZvcnNjaHVuZ3NuZXR6ZXMgZS4gVi4xEDAOBgNVBAsTB0RGTi1QS0kxLTArBgNV
BAMTJERGTi1WZXJlaW4gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkgMjAeFw0xNjExMDMxNTI0
NDhaFw0zMTAyMjIyMzU5NTlaMGoxCzAJBgNVBAYTAkRFMQ8wDQYDVQQIDAZCYXllcm4xETAP
BgNVBAcMCE11ZW5jaGVuMSAwHgYDVQQKDBdNYXgtUGxhbmNrLUdlc2VsbHNjaGFmdDEVMBMG
A1UEAwwMTVBHIENBIC0gRzAyMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnhx4
59Lh4WqgOs/Md04XxU2yFtfM15ZuJV0PZP7BmqSJKLLPyqmOrADfNdJ5PIGBto2JBhtRRBHd
G0GROOvTRHjzOga95WOTeura79T21FWwwAwa29OFnD3ZplQs6HgdwQrZWNi1WHNJxn/4mA19
rNEBUc5urSIpZPvZi5XmlF3v3JHOlx3KWV7mUteB4pwEEfGTg4npPAJbp2o7arxQdoIq+Pu2
OsvqhD7Rk4QeaX+EM1QS4lqd1otW4hE70h/ODPy1xffgbZiuotWQLC6nIwa65Qv6byqlIX0q
Zuu99Vsu+r3sWYsL5SBkgecNI7fMJ5tfHrjoxfrKl/ErTAt8GQIDAQABo4ICBTCCAgEwEgYD
VR0TAQH/BAgwBgEB/wIBATAOBgNVHQ8BAf8EBAMCAQYwKQYDVR0gBCIwIDANBgsrBgEEAYGt
IYIsHjAPBg0rBgEEAYGtIYIsAQEEMB0GA1UdDgQWBBTEiKUH7rh7qgwTv9opdGNSG0lwFjAf
BgNVHSMEGDAWgBST49gyJtrV8UqlkUrg6kviogzP4TCBjwYDVR0fBIGHMIGEMECgPqA8hjpo
dHRwOi8vY2RwMS5wY2EuZGZuLmRlL2dsb2JhbC1yb290LWcyLWNhL3B1Yi9jcmwvY2Fjcmwu
Y3JsMECgPqA8hjpodHRwOi8vY2RwMi5wY2EuZGZuLmRlL2dsb2JhbC1yb290LWcyLWNhL3B1
Yi9jcmwvY2FjcmwuY3JsMIHdBggrBgEFBQcBAQSB0DCBzTAzBggrBgEFBQcwAYYnaHR0cDov
L29jc3AucGNhLmRmbi5kZS9PQ1NQLVNlcnZlci9PQ1NQMEoGCCsGAQUFBzAChj5odHRwOi8v
Y2RwMS5wY2EuZGZuLmRlL2dsb2JhbC1yb290LWcyLWNhL3B1Yi9jYWNlcnQvY2FjZXJ0LmNy
dDBKBggrBgEFBQcwAoY+aHR0cDovL2NkcDIucGNhLmRmbi5kZS9nbG9iYWwtcm9vdC1nMi1j
YS9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwDQYJKoZIhvcNAQELBQADggEBABLpeD5FygzqOjj+
/lAOy20UQOGWlx0RMuPcI4nuyFT8SGmK9lD7QCg/HoaJlfU/r78ex+SEide326evlFAoJXIF
jVyzNltDhpMKrPIDuh2N12zyn1EtagqPL6hu4pVRzcBpl/F2HCvtmMx5K4WN1L1fmHWLcSap
dhXLvAZ9RG/B3rqyULLSNN8xHXYXpmtvG0VGJAndZ+lj+BH7uvd3nHWnXEHC2q7iQlDUqg0a
wIqWJgdLlx1Q8Dg/sodv0m+LN0kOzGvVDRCmowBdWGhhusD+duKV66pBl+qhC+4LipariWaM
qK5ppMQROATjYeNRvwI+nDcEXr2vDaKmdbxgDVwwggWvMIIEl6ADAgECAgweKlJIhfynPMVG
/KIwDQYJKoZIhvcNAQELBQAwajELMAkGA1UEBhMCREUxDzANBgNVBAgMBkJheWVybjERMA8G
A1UEBwwITXVlbmNoZW4xIDAeBgNVBAoMF01heC1QbGFuY2stR2VzZWxsc2NoYWZ0MRUwEwYD
VQQDDAxNUEcgQ0EgLSBHMDIwHhcNMTcxMTE0MTEzNDE2WhcNMjAxMTEzMTEzNDE2WjCBizEL
MAkGA1UEBhMCREUxIDAeBgNVBAoMF01heC1QbGFuY2stR2VzZWxsc2NoYWZ0MTQwMgYDVQQL
DCtNYXgtUGxhbmNrLUluc3RpdHV0IGZ1ZXIgbW9sZWt1bGFyZSBHZW5ldGlrMQ4wDAYDVQQL
DAVNUElNRzEUMBIGA1UEAwwLUGF1bCBNZW56ZWwwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
ggEKAoIBAQDIh/UR/AX/YQ48VWWDMLTYtXjYJyhRHMc81ZHMMoaoG66lWB9MtKRTnB5lovLZ
enTIUyPsCrMhTqV9CWzDf6v9gOTWVxHEYqrUwK5H1gx4XoK81nfV8oGV4EKuVmmikTXiztGz
peyDmOY8o/EFNWP7YuRkY/lPQJQBeBHYq9AYIgX4StuXu83nusq4MDydygVOeZC15ts0tv3/
6WmibmZd1OZRqxDOkoBbY3Djx6lERohs3IKS6RKiI7e90rCSy9rtidJBOvaQS9wvtOSKPx0a
+2pAgJEVzZFjOAfBcXydXtqXhcpOi2VCyl+7+LnnTz016JJLsCBuWEcB3kP9nJYNAgMBAAGj
ggIxMIICLTAJBgNVHRMEAjAAMA4GA1UdDwEB/wQEAwIF4DAdBgNVHSUEFjAUBggrBgEFBQcD
AgYIKwYBBQUHAwQwHQYDVR0OBBYEFHM0Mc3XjMLlhWpp4JufRELL4A/qMB8GA1UdIwQYMBaA
FMSIpQfuuHuqDBO/2il0Y1IbSXAWMCAGA1UdEQQZMBeBFXBtZW56ZWxAbW9sZ2VuLm1wZy5k
ZTB9BgNVHR8EdjB0MDigNqA0hjJodHRwOi8vY2RwMS5wY2EuZGZuLmRlL21wZy1nMi1jYS9w
dWIvY3JsL2NhY3JsLmNybDA4oDagNIYyaHR0cDovL2NkcDIucGNhLmRmbi5kZS9tcGctZzIt
Y2EvcHViL2NybC9jYWNybC5jcmwwgc0GCCsGAQUFBwEBBIHAMIG9MDMGCCsGAQUFBzABhido
dHRwOi8vb2NzcC5wY2EuZGZuLmRlL09DU1AtU2VydmVyL09DU1AwQgYIKwYBBQUHMAKGNmh0
dHA6Ly9jZHAxLnBjYS5kZm4uZGUvbXBnLWcyLWNhL3B1Yi9jYWNlcnQvY2FjZXJ0LmNydDBC
BggrBgEFBQcwAoY2aHR0cDovL2NkcDIucGNhLmRmbi5kZS9tcGctZzItY2EvcHViL2NhY2Vy
dC9jYWNlcnQuY3J0MEAGA1UdIAQ5MDcwDwYNKwYBBAGBrSGCLAEBBDARBg8rBgEEAYGtIYIs
AQEEAwYwEQYPKwYBBAGBrSGCLAIBBAMGMA0GCSqGSIb3DQEBCwUAA4IBAQCQs6bUDROpFO2F
Qz2FMgrdb39VEo8P3DhmpqkaIMC5ZurGbbAL/tAR6lpe4af682nEOJ7VW86ilsIJgm1j0ueY
aOuL8jrN4X7IF/8KdZnnNnImW3QVni6TCcc+7+ggci9JHtt0IDCj5vPJBpP/dKXLCN4M+exl
GXYpfHgxh8gclJPY1rquhQrihCzHfKB01w9h9tWZDVMtSoy9EUJFhCXw7mYUsvBeJwZesN2B
fndPkrXx6XWDdU3S1LyKgHlLIFtarLFm2Hb5zAUR33h+26cN6ohcGqGEEzgIG8tXS8gztEaj
1s2RyzmKd4SXTkKR3GhkZNVWy+gM68J7jP6zzN+cMYIDmjCCA5YCAQEwejBqMQswCQYDVQQG
EwJERTEPMA0GA1UECAwGQmF5ZXJuMREwDwYDVQQHDAhNdWVuY2hlbjEgMB4GA1UECgwXTWF4
LVBsYW5jay1HZXNlbGxzY2hhZnQxFTATBgNVBAMMDE1QRyBDQSAtIEcwMgIMHipSSIX8pzzF
RvyiMA0GCWCGSAFlAwQCAQUAoIIB8TAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqG
SIb3DQEJBTEPFw0yMDAxMDcxNTM1MDVaMC8GCSqGSIb3DQEJBDEiBCA5EjlyAYuhX/MJ8lA3
kpKhbHlPLGaQh7KDSxbC9W/qcjBsBgkqhkiG9w0BCQ8xXzBdMAsGCWCGSAFlAwQBKjALBglg
hkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcG
BSsOAwIHMA0GCCqGSIb3DQMCAgEoMIGJBgkrBgEEAYI3EAQxfDB6MGoxCzAJBgNVBAYTAkRF
MQ8wDQYDVQQIDAZCYXllcm4xETAPBgNVBAcMCE11ZW5jaGVuMSAwHgYDVQQKDBdNYXgtUGxh
bmNrLUdlc2VsbHNjaGFmdDEVMBMGA1UEAwwMTVBHIENBIC0gRzAyAgweKlJIhfynPMVG/KIw
gYsGCyqGSIb3DQEJEAILMXygejBqMQswCQYDVQQGEwJERTEPMA0GA1UECAwGQmF5ZXJuMREw
DwYDVQQHDAhNdWVuY2hlbjEgMB4GA1UECgwXTWF4LVBsYW5jay1HZXNlbGxzY2hhZnQxFTAT
BgNVBAMMDE1QRyBDQSAtIEcwMgIMHipSSIX8pzzFRvyiMA0GCSqGSIb3DQEBAQUABIIBAKul
O8IW2d7FksP5usXZuPQGVO4/gUFKfuuCKNNSNRg8yvLAK7yVhMmUw77qjuDwHimTsI5Zj5q5
u+nK9zwL83kvj4o/buR0hq8ZLldePsLNfrLVb9P9r2MkKu3WJlVSU5/RnyTXcjcUUqo92KTO
3RxFQzv4jAy3kcf51jyZj74WXnXfCtw2G9Qp1UxXmyf/uWCQwTocFCP8HESzcgP6f/w+bPs0
riBqUfAv22/erEcILyX5+umfXCyJ03wA78454uoAfnX685trmYgiekvvhOnoYmShdB6iH40B
oZPspG63Ajuhz66lk3g+x9DegBYKvmN4tmrGjlts2Cm3s1exboEAAAAAAAA=
--------------ms070508000006060207030306--
